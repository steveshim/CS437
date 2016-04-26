package springmusic.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmusic.model.Artist;
import springmusic.model.dao.ArtistDao;

@Repository
public class ArtistDaoImpl implements ArtistDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    @Transactional
    public void delete(Artist artist) {
        em.remove(artist);
    }

    @Override
    public Artist getArtist(int id) {
        return em.find(Artist.class, id);
    }

    @Override
    public List<Artist> getArtists() {
        return em.createQuery("FROM Artist", Artist.class).getResultList();
    }

    @Override
    public List<Artist> searchArtist(String searchTerm) {
        String query = "FROM Artist a WHERE UPPER(a.name) LIKE  ?1 ";
        return em.createQuery(query, Artist.class)
                .setParameter(1, "%" + searchTerm.toUpperCase() + "%")
                .getResultList();
    }

    @Override
    @Transactional
    public Artist save(Artist artist) {
        return em.merge(artist);
    }
}
