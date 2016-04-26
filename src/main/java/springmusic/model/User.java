package springmusic.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "user_id")
    @GeneratedValue
    private Integer id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private String email;

    private String password;

    @Enumerated(EnumType.STRING)
    private State state;

    @ManyToMany(mappedBy = "playlistUsers", cascade = CascadeType.ALL)
    private List<Track> playlist;

    @ManyToMany(mappedBy = "downloadUsers", cascade = CascadeType.ALL)
    private List<Track> downloads;

    @OneToMany(mappedBy = "user")
    private List<Comment> comments;
    
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<UploadTrack> uploadTracks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public List<Track> getPlaylist() {
        return playlist;
    }

    public void setPlaylist(List<Track> playlist) {
        this.playlist = playlist;
    }

    public List<Track> getDownloads() {
        return downloads;
    }

    public void setDownloads(List<Track> downloads) {
        this.downloads = downloads;
    }

    public void addPlaylistTrack(Track track) {
        playlist.add(track);
    }

    public void removePlayListTrack(Track track) {
        playlist.remove(track);
    }

    public void addDownloadTrack(Track track) {
        downloads.add(track);
    }

    public void removeDownloadTrack(Track track) {
        downloads.remove(track);
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    } 

    public List<UploadTrack> getUploadTracks() {
        return uploadTracks;
    }

    
    public void setUploadTracks(List<UploadTrack> uploadTracks) {
        this.uploadTracks = uploadTracks;
    }
    
    public void addUploackTrack(UploadTrack uploadTrack) {
        this.uploadTracks.add(uploadTrack);
    }
    
    public void removeUploadTrack(UploadTrack uploadTrack) {
        this.uploadTracks.remove(uploadTrack);
    }

    public String toString() {
        return id + "-" + firstName + "-" + lastName + "-" + email;
    }
}
