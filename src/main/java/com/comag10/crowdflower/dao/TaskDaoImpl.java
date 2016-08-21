package com.comag10.crowdflower.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.model.Hobby;
import com.comag10.crowdflower.model.HousingLocation;
import com.comag10.crowdflower.model.ImageIdentification;
import com.comag10.crowdflower.model.ImageIdentificationDeliverable;
import com.comag10.crowdflower.model.Location;
import com.comag10.crowdflower.model.OuluHobbiesDeliverable;
import com.comag10.crowdflower.model.PlaceDescriptionDeliverable;
import com.comag10.crowdflower.model.PlaceDescriptionQuestion;
import com.comag10.crowdflower.model.SentimentAnalysis;
import com.comag10.crowdflower.model.SentimentAnalysisDeliverable;
import com.comag10.crowdflower.model.StudentHousingDeliverable;
import com.comag10.crowdflower.model.Task;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.model.VisualAnalysis;
import com.comag10.crowdflower.model.VisualAnalysisDeliverable;
import com.comag10.crowdflower.model.WordRelevancyDeliverable;
import com.comag10.crowdflower.model.WordRelevancySentence;
import com.comag10.crowdflower.model.WordRelevancyWord;


@Repository
public class TaskDaoImpl implements TaskDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@SuppressWarnings("unchecked")
	public List<Task> getAllTasks() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Task> taskList = session.createQuery(" from Tasks").list();

		return taskList;
	}

	@SuppressWarnings("unchecked")
	public List<Task> getSituatedTasks(int categoryId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("from Task where fk_task_category_id= :categoryId ");
		query.setParameter("categoryId", categoryId);
		List<Task> taskList = query.list();

		return taskList;
	}

	@SuppressWarnings("unchecked")
	public List<Task> getLocationBasedTasks(int categoryId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("from Task where fk_task_category_id= :categoryId ");
		query.setParameter("categoryId", categoryId);
		List<Task> taskList = query.list();

		return taskList;
	}

	@SuppressWarnings("unchecked")
	public List<Task> getAnywhereTasks(int categoryId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("from Task where fk_task_category_id= :categoryId ");
		query.setParameter("categoryId", categoryId);
		List<Task> taskList = query.list();

		return taskList;
	}

	@SuppressWarnings("unchecked")
	public Task fetchTaskByName(String name) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("from Task where task_name= :name ");
		query.setParameter("name", name);
		List<Task> taskList = query.list();

		return taskList.get(0);

	}

	@SuppressWarnings("unchecked")
	public ImageIdentification fetchRandomImageResource(int userId) {

		List<ImageIdentificationDeliverable> imageDeliverables = this.fetchAllImageIdentificationDeliverables(userId);
		String queryStr = "";

		if(imageDeliverables.size()<=0) {
			queryStr = " FROM ImageIdentification ORDER BY rand()";
		}
		else {
			queryStr = " FROM ImageIdentification img WHERE img.resource_id NOT IN (";

			Iterator<ImageIdentificationDeliverable> iIdentificationIterator = imageDeliverables.iterator();
			while( iIdentificationIterator.hasNext() ) {
				queryStr+=iIdentificationIterator.next().getResource_id().getResource_id();

				if(iIdentificationIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<ImageIdentification> imageIdentificationResourceList = query.list();

		if(imageIdentificationResourceList.size()>0)
			return imageIdentificationResourceList.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public ImageIdentification fetchImageResourceById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM ImageIdentification WHERE id="+id);
		List<ImageIdentification> imageIdentificationResourceList = query.list();

		return imageIdentificationResourceList.get(0);
	}

	public Boolean submitImageIdentificationDeliverable(
			ImageIdentificationDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public VisualAnalysis fetchRandomVisualImageResource(int userId) {
		
		List<VisualAnalysisDeliverable> visualAnalysisDeliverables = this.fetchAllVisualAnalysisDeliverables(userId);
		String queryStr = "";

		if(visualAnalysisDeliverables.size()<=0) {
			queryStr = " FROM VisualAnalysis ORDER BY rand()";
		}
		else {
			queryStr = " FROM VisualAnalysis visual WHERE visual.resource_id NOT IN (";

			Iterator<VisualAnalysisDeliverable> visualAnalysisIterator = visualAnalysisDeliverables.iterator();
			while( visualAnalysisIterator.hasNext() ) {
				queryStr+=visualAnalysisIterator.next().getResource_id().getResource_id();

				if(visualAnalysisIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<VisualAnalysis> visualAnalysisResourceList = query.list();

		if(visualAnalysisResourceList.size()>0)
			return visualAnalysisResourceList.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public VisualAnalysis fetchVisualImageResourceById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM VisualAnalysis WHERE id="+id);
		List<VisualAnalysis> visualAnalysisResourceList = query.list();

		return visualAnalysisResourceList.get(0);
	}

	public Boolean submitVisualImageIdentificationDeliverable(
			VisualAnalysisDeliverable deliverable) {
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public SentimentAnalysis fetchRandomSentimentResource(int userId) {
		// TODO Auto-generated method stub
		
		List<SentimentAnalysisDeliverable> sentimentAnalysisDeliverables = this.fetchAllSentimentAnalysisDeliverables(userId);
		String queryStr = "";

		if(sentimentAnalysisDeliverables.size()<=0) {
			queryStr = " FROM SentimentAnalysis ORDER BY rand()";
		}
		else {
			queryStr = " FROM SentimentAnalysis sentiment WHERE sentiment.resource_id NOT IN (";

			Iterator<SentimentAnalysisDeliverable> sentimentAnalysisIterator = sentimentAnalysisDeliverables.iterator();
			while( sentimentAnalysisIterator.hasNext() ) {
				queryStr+=sentimentAnalysisIterator.next().getResource_id().getResource_id();

				if(sentimentAnalysisIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<SentimentAnalysis> sentimentAnalysisResourceList = query.list();

		if(sentimentAnalysisResourceList.size()>0)
			return sentimentAnalysisResourceList.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public SentimentAnalysis fetchSentimentResourceById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM SentimentAnalysis WHERE id="+id);
		List<SentimentAnalysis> sentimentAnalysisResourceList = query.list();

		return sentimentAnalysisResourceList.get(0);
	}

	public Boolean submitSentimentTaskDeliverable(
			SentimentAnalysisDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public WordRelevancySentence fetchRandomWordRelevancySentence(int userId) {
		// TODO Auto-generated method stub
		
		List<WordRelevancyDeliverable> relevancyDeliverables = this.fetchAllWordRelevancyDeliverables(userId);
		String queryStr = "";

		if(relevancyDeliverables.size()<=0) {
			queryStr = " FROM WordRelevancySentence ORDER BY rand()";
		}
		else {
			queryStr = " FROM WordRelevancySentence sentence WHERE sentence.sentence_id NOT IN (";

			Iterator<WordRelevancyDeliverable> relevancyIterator = relevancyDeliverables.iterator();
			while( relevancyIterator.hasNext() ) {
				queryStr+=relevancyIterator.next().getSentence().getSentence_id();

				if(relevancyIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<WordRelevancySentence> wordRelevancyList = query.list();

		if(wordRelevancyList.size()>0)
			return wordRelevancyList.get(0);
		else
			return null;
		
	}

	public Boolean submitWordRelevancyDeliverable(
			WordRelevancyDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public WordRelevancyWord fetchWordByWordId(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM WordRelevancyWord WHERE word_id="+id);
		List<WordRelevancyWord> wordRelevancyWordList = query.list();

		return wordRelevancyWordList.get(0);
	}

	@SuppressWarnings("unchecked")
	public WordRelevancySentence fetchSentenceBySentenceId(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM WordRelevancySentence WHERE sentence_id="+id);
		List<WordRelevancySentence> wordRelevancySentenceList = query.list();

		return wordRelevancySentenceList.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<PlaceDescriptionQuestion> fetchAllQuestions() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM PlaceDescriptionQuestion");
		List<PlaceDescriptionQuestion> placeDescriptionQuestionList = query.list();

		return placeDescriptionQuestionList;
	}

	public Boolean submitPlaceDescriptionDeliverable(
			PlaceDescriptionDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public Location fetchRandomLocation() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM Location ORDER BY rand()");
		query.setMaxResults(1);
		List<Location> locationList = query.list();

		return locationList.get(0);
	}

	@SuppressWarnings("unchecked")
	public Location fetchLocationById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM Location WHERE id="+id);
		List<Location> locationList = query.list();

		return locationList.get(0);
	}

	public Boolean submitOuluHobbiesDeliverable(OuluHobbiesDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserDeliverable(User user, String locationId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM PlaceDescriptionDeliverable WHERE fk_user_id="+user.getId()+" AND location_id="+locationId);
		List<PlaceDescriptionDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserSentimentAnalysisDeliverable(User user, String resourceId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM SentimentAnalysisDeliverable WHERE fk_user_id="+user.getId()+" AND resource_id="+resourceId);
		List<SentimentAnalysisDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserHobbiesDeliverable(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM OuluHobbies WHERE fk_user_id="+user.getId());
		List<SentimentAnalysisDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserWordRelevanceDeliverable(User user, String sentenceId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM WordRelevancyDeliverable WHERE fk_user_id="+user.getId()+" AND fk_sentence_id="+sentenceId);
		List<WordRelevancyDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserImageIdentificationDeliverable(User user,
			String resourceId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM ImageIdentificationDeliverable WHERE fk_user_id="+user.getId()+" AND resource_id="+resourceId);
		List<ImageIdentificationDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	@SuppressWarnings("unchecked")
	public Boolean checkUserVisualAnalysisDeliverable(User user,
			String resourceId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM VisualAnalysisDeliverable WHERE fk_user_id="+user.getId()+" AND resource_id="+resourceId);
		List<VisualAnalysisDeliverable> deliverableList = query.list();

		return deliverableList.size()>0 ? true:false;
	}

	public int getAllUserTasks(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getUserSituatedTasks(User user) {
		// TODO Auto-generated method stub

		int imageIdentificationCount = this.getUserImageIdentificationDeliveables(user);
		int ouluHobbiesCount = this.getUserOuluhobbiesDeliveables(user);
		int studentHousingCount = this.getUserStudentHousingDeliveables(user);

		int totalCount = imageIdentificationCount+ouluHobbiesCount+studentHousingCount;

		return totalCount;
	}

	public int getUserLocationBasedTasks(User user) {
		// TODO Auto-generated method stub
		int placeDescriptionCount = this.getUserPlaceDescriptionDeliveables(user);

		return placeDescriptionCount;
	}

	public int getUserAnywhereTasks(User user) {
		// TODO Auto-generated method stub

		int sentimentAnalysisCount = this.getUserSentimentAnalysisDeliveables(user);
		int visualAnalysisCount = this.getUserVisualAnalysisDeliveables(user);
		int wordRelevancyCount = this.getUserWordRelevancyDeliveables(user);

		int totalCount = sentimentAnalysisCount+visualAnalysisCount+wordRelevancyCount;

		return totalCount;
	}

	@SuppressWarnings("unchecked")
	public int getUserImageIdentificationDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM ImageIdentificationDeliverable WHERE fk_user_id="+user.getId());
		List<ImageIdentificationDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}
	
	@SuppressWarnings("unchecked")
	public int getUserStudentHousingDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM StudentHousingDeliverable WHERE fk_user_id="+user.getId());
		List<StudentHousingDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public int getUserOuluhobbiesDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM OuluHobbiesDeliverable WHERE fk_user_id="+user.getId());
		List<OuluHobbiesDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public int getUserPlaceDescriptionDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM PlaceDescriptionDeliverable WHERE fk_user_id="+user.getId());
		List<PlaceDescriptionDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public int getUserWordRelevancyDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM WordRelevancyDeliverable WHERE fk_user_id="+user.getId());
		List<WordRelevancyDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public int getUserSentimentAnalysisDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM SentimentAnalysisDeliverable WHERE fk_user_id="+user.getId());
		List<SentimentAnalysisDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public int getUserVisualAnalysisDeliveables(User user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM VisualAnalysisDeliverable WHERE fk_user_id="+user.getId());
		List<VisualAnalysisDeliverable> deliverableList = query.list();

		return deliverableList.size();
	}

	@SuppressWarnings("unchecked")
	public HousingLocation fetchRandomHousingLocation(int userId) {

		List<StudentHousingDeliverable> studentHousingDeliverables = this.fetchAllStudentHousingDeliverables(userId);

		String queryStr = "";

		if(studentHousingDeliverables.size()<=0) {
			queryStr = " FROM HousingLocation ORDER BY rand()";
		}
		else {
			queryStr = " FROM HousingLocation location WHERE location.id NOT IN (";

			Iterator<StudentHousingDeliverable> locationIterator = studentHousingDeliverables.iterator();
			while( locationIterator.hasNext() ) {
				queryStr+=locationIterator.next().getFk_housing_location_id();

				if(locationIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<HousingLocation> housingList = query.list();

		for( HousingLocation location : housingList ) {
			System.out.println( "remaining id is "+location.getId() );
		}

		if(housingList.size()>0)
			return housingList.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public HousingLocation fetchHousingLocationById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM HousingLocation WHERE id="+id);
		List<HousingLocation> locationList = query.list();

		return locationList.get(0);
	}

	public Boolean submitStudentHousingDeliverable(
			StudentHousingDeliverable deliverable) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(deliverable);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	public Boolean submitNewHobby(Hobby hobby) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(hobby);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

	@SuppressWarnings("unchecked")
	public Hobby fetchRandomHobby(int userId) {
		List<OuluHobbiesDeliverable> hobbiesDeliverables = this.fetchAllOuluHobbiesDeliverables(userId);

		String queryStr = "";

		if(hobbiesDeliverables.size()<=0) {
			queryStr = " FROM Hobby ORDER BY rand()";
		}
		else {
			queryStr = " FROM Hobby hobby WHERE hobby.id NOT IN (";

			Iterator<OuluHobbiesDeliverable> iIdentificationIterator = hobbiesDeliverables.iterator();
			while( iIdentificationIterator.hasNext() ) {
				queryStr+=iIdentificationIterator.next().getFk_hobby_id();

				if(iIdentificationIterator.hasNext())
					queryStr+=",";
			}

			queryStr+= ")";
		}

		System.out.println("query string is "+queryStr);

		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(queryStr);
		List<Hobby> ouluHobbiesList = query.list();

		for( Hobby hobby : ouluHobbiesList ) {
			System.out.println( "remaining id is "+hobby.getId() );
		}

		if(ouluHobbiesList.size()>0)
			return ouluHobbiesList.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	public List<ImageIdentificationDeliverable> fetchAllImageIdentificationDeliverables(int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM ImageIdentificationDeliverable WHERE fk_user_id="+userId);
		List<ImageIdentificationDeliverable> deliverableList = query.list();

		return deliverableList;
	}

	@SuppressWarnings("unchecked")
	public List<OuluHobbiesDeliverable> fetchAllOuluHobbiesDeliverables(
			int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM OuluHobbiesDeliverable WHERE fk_user_id="+userId);
		List<OuluHobbiesDeliverable> deliverableList = query.list();

		return deliverableList;
	}

	@SuppressWarnings("unchecked")
	public List<StudentHousingDeliverable> fetchAllStudentHousingDeliverables(
			int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM StudentHousingDeliverable WHERE fk_user_id="+userId);
		List<StudentHousingDeliverable> deliverableList = query.list();

		return deliverableList;
	}
	
	@SuppressWarnings("unchecked")
	public List<WordRelevancyDeliverable> fetchAllWordRelevancyDeliverables(
			int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM WordRelevancyDeliverable WHERE fk_user_id="+userId);
		List<WordRelevancyDeliverable> deliverableList = query.list();

		return deliverableList;
	}
	
	@SuppressWarnings("unchecked")
	public List<SentimentAnalysisDeliverable> fetchAllSentimentAnalysisDeliverables(
			int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM SentimentAnalysisDeliverable WHERE fk_user_id="+userId);
		List<SentimentAnalysisDeliverable> deliverableList = query.list();

		return deliverableList;
	}

	@SuppressWarnings("unchecked")
	public List<VisualAnalysisDeliverable> fetchAllVisualAnalysisDeliverables(
			int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM VisualAnalysisDeliverable WHERE fk_user_id="+userId);
		List<VisualAnalysisDeliverable> deliverableList = query.list();

		return deliverableList;
	}
}