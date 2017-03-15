package com.comag10.crowdflower.service;

import java.util.List;

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

public interface TaskService {
	
	public List<Task> getAllTasks();
	public List<Task> getSituatedTasks(int categoryId);
	public List<Task> getLocationbasedTasks(int categoryId);
	public List<Task> getAnywhereTasks(int categoryId);
	public Task getTaskByName(String name);
	public ImageIdentification getRandomImageIdentificationResource(int userId);
	public ImageIdentification getImageIdentificationResourceById(int id);
	public Boolean addNewImageIdentificationResourceDeliverable(ImageIdentificationDeliverable deliverable);
	public VisualAnalysis getRandomVisualAnalysisResource(int userId);
	public VisualAnalysis getVisualAnalysisResourceById(int id);
	public Boolean addNewVisualAnalysisResourceDeliverable(VisualAnalysisDeliverable deliverable);
	public SentimentAnalysis getRandomSentimentAnalysisResource(int userid);
	public SentimentAnalysis getSentimentAnalysisResourceById(int id);
	public Boolean addNewSentimentAnalysisResourceDeliverable(SentimentAnalysisDeliverable deliverable);
	public WordRelevancySentence getRandomWordRelevancySentence(int userId);
	public Boolean addNewWordRelevancyDeliverable(WordRelevancyDeliverable deliverable);
	public WordRelevancyWord getWordByWordId(int id);
	public WordRelevancySentence getSentenceBySentenceId(int id);
	public List<PlaceDescriptionQuestion> getAllQuestions();
	public Boolean addNewPlaceDescriptionDeliverable(PlaceDescriptionDeliverable deliverable);
	public List<Location> getLocations(User user);
	public Location getLocationById(int id);
	public Boolean addNewOuluHobbiesDeliverable(OuluHobbiesDeliverable deliverable);
	public Boolean checkUserDeliverable(User user, String locationId);
	public Boolean checkUserSentimentAnalysisDeliverable(User user, String resourceId);
	public Boolean checkUserHobbiesDeliverable(User user);
	public Boolean checkUserWordRelevanceDeliverable(User user, String sentenceId);
	public Boolean checkUserImageIdentificationDeliverable(User user, String resourceId);
	public Boolean checkUserVisualAnalysisDeliverable(User user, String resourceId);
	public int getUserSituatedTasks(User user);
	public int getUserLocationBasedTasks(User user);
	public int getUserAnywhereTasks(User user);
	public HousingLocation getRandomHousingLocation(int userId);
	public HousingLocation getHousingLocationById(int id);
	public Boolean addNewStudentHousingDeliverable(StudentHousingDeliverable deliverable);
	public Boolean addNewHobby(Hobby deliverable);
	public Hobby getRandomHobby(int userId);
	public List<ImageIdentificationDeliverable> getAllImageIdentificationDeliverables(int userId);
	public List<PlaceDescriptionDeliverable> getAllPlaceDescriptionDeliverables(int userId);
	public Boolean checkUserSurvey(User u);
	public Boolean addNewUserSurveyDeliverable(Survey deliverable);
	public SentimentAnalysis getSentimentAnalysisDeliverables(SentimentAnalysis sentiment);
}