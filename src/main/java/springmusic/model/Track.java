package springmusic.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tracks")
public class Track implements Serializable, Comparable<Track> {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "track_id")
    @GeneratedValue
    private Integer id;

    @Column(name = "track_name")
    private String name;

    @Column(name = "track_num")
    private int number;

    @Column(name = "audio_src")
    private String audioSrc;

    @ManyToOne
    @JoinColumn(name = "album_id")
    private Album album;

    @Embedded
    private Lyric lyric;

    @OneToMany(mappedBy = "track")
    private List<Comment> comments;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "playlists",
            joinColumns = @JoinColumn(name = "track_id") ,
            inverseJoinColumns = @JoinColumn(name = "user_id") )
    private List<User> playlistUsers;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "downloads",
            joinColumns = @JoinColumn(name = "track_id") ,
            inverseJoinColumns = @JoinColumn(name = "user_id") )
    private List<User> downloadUsers;

    @Column(nullable = true)
    private Integer count;

    @Column(nullable = true)
    private boolean feature;

    public Track() {
        count = 0;
        feature = false;
    }

    public Track(String name, int number) {
        this.name = name;
        this.number = number;
        comments = new ArrayList<Comment>();

        lyric = new Lyric();
        count = 0;
        feature = false;
    }

    public void addDownloadUser(User user) {
        downloadUsers.add(user);
    }

    public void removeDownloadUser(User user) {
        downloadUsers.remove(user);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getAudioSrc() {
        return audioSrc;
    }

    public void setAudioSrc(String audioSrc) {
        this.audioSrc = audioSrc;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Lyric getLyric() {
        return lyric;
    }

    public void setLyric(Lyric lyric) {
        this.lyric = lyric;
    }

    public List<User> getPlaylistUsers() {
        return playlistUsers;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void setPlaylistUsers(List<User> playlistUsers) {
        this.playlistUsers = playlistUsers;
    }

    public List<User> getDownloadUsers() {
        return downloadUsers;
    }

    public void setDownloadUsers(List<User> downloadUsers) {
        this.downloadUsers = downloadUsers;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void incrementCount() {
        count++;
    }

    public boolean isFeature() {
        return feature;
    }

    public void setFeature(boolean feature) {
        this.feature = feature;
    }

    public void addPlaylistUser(User user) {
        playlistUsers.add(user);
    }

    public void removePlaylistUser(User user) {
        playlistUsers.remove(user);
    }

    public void addComments(Comment comment) {
        comments.add(comment);
    }

    public void removeComment(Comment comment) {
        comments.remove(comment);
    }

    @Override
    public int compareTo(Track o) {
        return name.compareTo(o.getName());
    }
}
