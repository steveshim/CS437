
package springmusic.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springmusic.model.Album;
import springmusic.model.Artist;
import springmusic.model.Comment;
import springmusic.model.Genre;
import springmusic.model.Track;
import springmusic.model.dao.AlbumDao;
import springmusic.model.dao.ArtistDao;
import springmusic.model.dao.CommentDao;
import springmusic.model.dao.TrackDao;
import springmusic.model.dao.UploadTrackDao;

@Controller
@SessionAttributes("artist")
public class MusicController {

    @Autowired
    private TrackDao trackDao;

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private ArtistDao artistDao;

    @Autowired
    private AlbumDao albumDao;
    
    @Autowired
    private UploadTrackDao uploadTrackDao;
    
    private String[] images = new String[] { "http://goo.gl/80hy74",
            "http://goo.gl/FwkE9R", "http://goo.gl/Ulu3nW" };

    @RequestMapping(value = "/newRecord.html", method = RequestMethod.POST)
    public String addNewRecord(@ModelAttribute Album newAlbum,
            @RequestParam String track1, @RequestParam String track2,
            @RequestParam String track3, @RequestParam String track4,
            @RequestParam String artistid) {

        // set album artist
        newAlbum.setArtist(artistDao.getArtist(Integer.parseInt(artistid)));

        // add tracks to album
        newAlbum.addTrack(new Track(track1, 1));
        newAlbum.addTrack(new Track(track2, 2));
        newAlbum.addTrack(new Track(track3, 3));
        newAlbum.addTrack(new Track(track4, 4));

        // save album to database
        albumDao.save(newAlbum);

        return "redirect:home.html";
    }

    @RequestMapping(value = "/newRecord.html", method = RequestMethod.GET)
    public String addNewRecord(ModelMap models) {
        Album album = new Album();
        album.setTracks(new ArrayList<Track>());

        models.put("artists", artistDao.getArtists());
        models.put("images", images);
        models.put("newAlbum", album);
        return "NewRecord";
    }

    @RequestMapping("/album.html")
    public String album(@RequestParam int id, ModelMap models) {
        Album album = albumDao.getAlbum(id);
        models.put("album", album);
        return "AlbumPage";
    }

    @RequestMapping("/artist.html")
    public String artist(@RequestParam int id, ModelMap models) {
        models.put("artist", artistDao.getArtist(id));
        return "ArtistPage";
    }

    @RequestMapping(value = "lyricEdit.html")
    public String editLyric(@RequestParam int trackid,
            @RequestParam String lyrics, HttpSession session) {

        Track track = trackDao.getTrack(trackid);
        track.getLyric().setTrackLyric(lyrics);
        trackDao.save(track);

        return "redirect:home.html";
    }

    @RequestMapping(value = "/editor.html", method = RequestMethod.GET)
    public String editor(ModelMap models) {
        List<Track> features = trackDao.getFeatureTracks();
        // sort features track by artist's name
        Collections.sort(features, new Comparator<Track>() {

            @Override
            public int compare(Track o1, Track o2) {
                String artistName1 = o1.getAlbum().getArtist().getName();
                String artistName2 = o2.getAlbum().getArtist().getName();
                return artistName1.compareTo(artistName2);
            }
        });

        models.put("features", features);
        models.put("tracks", trackDao.getTracks());
        return "Editor";
    }

    @RequestMapping(value = "/editor.html", method = RequestMethod.POST)
    public String editor(@RequestParam String[] special, ModelMap models) {

        // set feature to false for all the current tracks
        List<Track> oldFeatures = trackDao.getFeatureTracks();
        for (Track track : oldFeatures) {
            track.setFeature(false);
            trackDao.save(track);
        }

        // set feature to true for the new tracks
        for (int i = 0; i < special.length; i++) {
            Track track = trackDao.getTrack(Integer.parseInt(special[i]));
            track.setFeature(true);
            trackDao.save(track);
        }

        return "redirect:home.html";
    }

    @RequestMapping(value = "/genre.html")
    public String genre(@RequestParam Genre genre, ModelMap models) {
        models.put("searchResults", trackDao.getTracks(genre));
        models.put("searchBar", genre);
        return "HomePage";
    }

    @RequestMapping(value = "/simpleGenre.html", method = RequestMethod.GET)
    public String simpleGenre(ModelMap models, @RequestParam String genre) {
        models.put("listOfGenres", Genre.values());
        if (!genre.isEmpty()) {
            List<Track> genreTracks = trackDao.getTracks(Genre.valueOf(genre));
            models.put("genreTracks", genreTracks);
        }
        return "GenrePage";
    }

    @RequestMapping(value = "/topTracks.html")
    public String topTracks(@RequestParam String genre, ModelMap models) {

        if (genre.equals("ALL"))
            models.put("tracks", trackDao.getTopTracks(10));
        else
            models.put("tracks",
                    trackDao.getTopTracks(10, Genre.valueOf(genre)));

        models.put("msg", genre);
        return "TopTracks";

    }

    @RequestMapping("/SongPage.html")
    public String track(@RequestParam int trackid, ModelMap models) {
        Track track = trackDao.getTrack(trackid);
        List<Comment> comments = commentDao.getComments(track);
        models.put("track", track);
        models.put("reviews", comments);
        return "SongPage";
    }

    @RequestMapping(value = "/selectEditArtist.html")
    public String selectArtist(ModelMap models, SessionStatus status) {
        if (!status.isComplete())
            status.setComplete();
        List<Artist> artists = artistDao.getArtists();
        Collections.sort(artists);
        models.put("artistList", artists);
        return "SelectEditArtist";
    }

    @RequestMapping(value = "/viewEditArtist.html", method = RequestMethod.GET)
    public String viewArtist(@RequestParam int id, ModelMap models,
            SessionStatus status) {

        models.put("artist", artistDao.getArtist(id));
        ;
        return "EditArtistView";
    }

    @RequestMapping(value = "/viewEditArtist.html", method = RequestMethod.POST)
    public String viewArtist(@ModelAttribute Artist artist,
            SessionStatus status) {

        artistDao.save(artist);
        status.setComplete();
        return "redirect:selectEditArtist.html";
    }

    @RequestMapping(value = "/cancelEditArtist.html")
    public String cancelEditArtist(SessionStatus status) {
        if (!status.isComplete())
            status.setComplete();
        return "redirect:selectEditArtist.html";
    }
    
    @RequestMapping(value = "/uploadList.html")
    public String viewUploads(ModelMap models) {
        
        models.put("uploads", uploadTrackDao.getUploadTracks());
        return "UploadList";
    }
}
