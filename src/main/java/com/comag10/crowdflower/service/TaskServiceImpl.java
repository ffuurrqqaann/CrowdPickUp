package com.comag10.crowdflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comag10.crowdflower.dao.TaskDao;
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
import com.comag10.crowdflower.model.Survey;
import com.comag10.crowdflower.model.Task;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.model.VisualAnalysis;
import com.comag10.crowdflower.model.VisualAnalysisDeliverable;
import com.comag10.crowdflower.model.WordRelevancyDeliverable;
import com.comag10.crowdflower.model.WordRelevancySentence;
import com.comag10.crowdflower.model.WordRelevancyWord;


@Service("TaskService")
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskDao taskDAO;

	public void setTaskDAO(TaskDao taskDao) {
		this.taskDAO = taskDao;
	}

	@Transactional
	public List<Task> getAllTasks() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	public List<Task> getSituatedTasks(int categoryId) {
		// TODO Auto-generated method stub
		return this.taskDAO.getSituatedTasks(1);
	}

	@Transactional
	public List<Task> getLocationbasedTasks(int categoryId) {
		// TODO Auto-generated method stub
		return this.taskDAO.getLocationBasedTasks(2);
	}

	@Transactional
	public List<Task> getAnywhereTasks(int categoryId) {
		// TODO Auto-generated method stub
		return this.taskDAO.getAnywhereTasks(3);
	}

	@Transactional
	public Task getTaskByName(String name) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchTaskByName(name);
	}

	@Transactional
	public ImageIdentification getRandomImageIdentificationResource(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomImageResource(userId);
	}

	@Transactional
	public ImageIdentification getImageIdentificationResourceById(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchImageResourceById(id);
	}

	@Transactional
	public Boolean addNewImageIdentificationResourceDeliverable(
			ImageIdentificationDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitImageIdentificationDeliverable(deliverable);
	}

	@Transactional
	public VisualAnalysis getRandomVisualAnalysisResource(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomVisualImageResource(userId);
	}

	@Transactional
	public VisualAnalysis getVisualAnalysisResourceById(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchVisualImageResourceById(id);
	}

	@Transactional
	public Boolean addNewVisualAnalysisResourceDeliverable(
			VisualAnalysisDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitVisualImageIdentificationDeliverable(deliverable);
	}

	@Transactional
	public SentimentAnalysis getRandomSentimentAnalysisResource(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomSentimentResource(userId);
	}

	@Transactional
	public SentimentAnalysis getSentimentAnalysisResourceById(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchSentimentResourceById(id);
	}

	@Transactional
	public Boolean addNewSentimentAnalysisResourceDeliverable(
			SentimentAnalysisDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitSentimentTaskDeliverable(deliverable);
	}

	@Transactional
	public WordRelevancySentence getRandomWordRelevancySentence(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomWordRelevancySentence(userId);
	}

	@Transactional
	public Boolean addNewWordRelevancyDeliverable(
			WordRelevancyDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitWordRelevancyDeliverable(deliverable);
	}

	@Transactional
	public WordRelevancyWord getWordByWordId(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchWordByWordId(id);
	}

	@Transactional
	public WordRelevancySentence getSentenceBySentenceId(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchSentenceBySentenceId(id);
	}

	@Transactional
	public List<PlaceDescriptionQuestion> getAllQuestions() {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchAllQuestions();
	}

	@Transactional
	public Boolean addNewPlaceDescriptionDeliverable(
			PlaceDescriptionDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitPlaceDescriptionDeliverable(deliverable);
	}

	@Transactional
	public Location getRandomLocation(User user) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomLocation(user.getId());
	}

	@Transactional
	public Location getLocationById(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchLocationById(id);
	}

	@Transactional
	public Boolean addNewOuluHobbiesDeliverable(OuluHobbiesDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitOuluHobbiesDeliverable(deliverable);
	}

	@Transactional
	public Boolean checkUserDeliverable(User user, String locationId) {
		Boolean isUserDeliverableExists = this.taskDAO.checkUserDeliverable(user, locationId);

		return isUserDeliverableExists;
	}

	@Transactional
	public Boolean checkUserSentimentAnalysisDeliverable(User user, String resourceId) {
		Boolean isUserDeliverableExists = this.taskDAO.checkUserSentimentAnalysisDeliverable(user, resourceId);

		return isUserDeliverableExists;
	}

	@Transactional
	public Boolean checkUserHobbiesDeliverable(User user) {
		// TODO Auto-generated method stub
		Boolean isUserDeliverableExists = this.taskDAO.checkUserHobbiesDeliverable(user);

		return isUserDeliverableExists;
	}

	@Transactional
	public Boolean checkUserWordRelevanceDeliverable(User user, String sentenceId) {
		// TODO Auto-generated method stub
		Boolean isUserDeliverableExists = this.taskDAO.checkUserWordRelevanceDeliverable(user, sentenceId);

		return isUserDeliverableExists;
	}

	@Transactional
	public Boolean checkUserImageIdentificationDeliverable(User user,
			String resourceId) {
		// TODO Auto-generated method stub
		Boolean isUserDeliverableExists = this.taskDAO.checkUserImageIdentificationDeliverable(user, resourceId);

		return isUserDeliverableExists;
	}

	@Transactional
	public Boolean checkUserVisualAnalysisDeliverable(User user,
			String resourceId) {
		// TODO Auto-generated method stub
		Boolean isUserDeliverableExists = this.taskDAO.checkUserVisualAnalysisDeliverable(user, resourceId);

		return isUserDeliverableExists;
	}

	@Transactional
	public int getUserSituatedTasks(User user) {
		// TODO Auto-generated method stub
		int count = this.taskDAO.getUserSituatedTasks(user);
		return count;
	}

	@Transactional
	public int getUserLocationBasedTasks(User user) {
		// TODO Auto-generated method stub
		int count = this.taskDAO.getUserLocationBasedTasks(user);
		return count;
	}

	@Transactional
	public int getUserAnywhereTasks(User user) {
		// TODO Auto-generated method stub
		int count = this.taskDAO.getUserAnywhereTasks(user);
		return count;
	}

	@Transactional
	public HousingLocation getRandomHousingLocation(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomHousingLocation(userId);
	}
	
	@Transactional
	public HousingLocation getHousingLocationById(int id) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchHousingLocationById(id);
	}

	@Transactional
	public Boolean addNewStudentHousingDeliverable(
			StudentHousingDeliverable deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitStudentHousingDeliverable(deliverable);
	}

	@Transactional
	public Boolean addNewHobby(Hobby hobby) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitNewHobby(hobby);
	}

	@Transactional
	public Hobby getRandomHobby(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchRandomHobby(userId);
	}

	@Transactional
	public List<ImageIdentificationDeliverable> getAllImageIdentificationDeliverables(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchAllImageIdentificationDeliverables(userId);
	}
	
	@Transactional
	public List<PlaceDescriptionDeliverable> getAllPlaceDescriptionDeliverables(int userId) {
		// TODO Auto-generated method stub
		return this.taskDAO.fetchAllPlaceDescriptionDeliverables(userId);
	}

	@Transactional
	public Boolean checkUserSurvey(User u) {
		// TODO Auto-generated method stub
		return this.taskDAO.checkUserSurvey(u);
	}

	@Transactional
	public Boolean addNewUserSurveyDeliverable(Survey deliverable) {
		// TODO Auto-generated method stub
		return this.taskDAO.submitUserSurvey(deliverable);
	}
	
}