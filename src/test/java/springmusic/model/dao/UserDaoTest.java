package springmusic.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import springmusic.model.User;

@Test(groups = "UserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    UserDao userDao;
    
    @Autowired
    TrackDao trackDao;

    @Test(alwaysRun = true)
    public void getUsersTest() {
        assert userDao.getUsers().size() == 2;
    }
    
    @Test
    public void getUserTest() {
        assert userDao.getUser(1).getFirstName().equals("abe");
    }
    
    @Test
    public void deleteUserTest() {
        userDao.deleteUser( userDao.getUser(1));
        assert userDao.getUsers().size() == 1;
    }
    
    @Test
    public void addPlaylistTrackTest() {
        User user = userDao.getUser(1);
        assert user.getPlaylist().size() == 0;
        user.addPlaylistTrack(trackDao.getTrack(1));
        assert user.getPlaylist().size() == 1;
    }
    
    @Test
    public void removePlaylistTrackTest() {
        User user = userDao.getUser(1);
        user.addPlaylistTrack(trackDao.getTrack(1));
        user.addPlaylistTrack(trackDao.getTrack(2));
        user.addPlaylistTrack(trackDao.getTrack(3));
        user.addDownloadTrack(trackDao.getTrack(1));
        
        assert user.getPlaylist().size() == 2;
    }

}