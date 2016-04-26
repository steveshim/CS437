package springmusic.model.dao;

import java.util.List;
import java.util.Map;

import springmusic.model.Genre;
import springmusic.model.Track;

public interface TrackDao {

    List<Track> getTracks();

    List<Track> getRandomTracks(int numOfTracks);

    List<Track> getTracks(Genre genre);

    List<Track> getComments(int id);
    
    List<Track> getTopTracks(int numOfTracks);
    
    List<Track> getTopTracks(int numOfTracks, Genre genre);
    
    List<Track> getFeatureTracks();
    
    List<Track> searchTrack(String searchTerm);

    Track getTrack(int id);

    Track save(Track track);

    Map<Genre, List<Track>> getGenreTracksMap();

    Map<Genre, List<Track>> getRandomGenreTracksMap();
    
    void delete(Track track);

}
