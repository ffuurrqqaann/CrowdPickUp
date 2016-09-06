package com.comag10.crowdflower.dao;

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
import com.comag10.crowdflower.model.Task;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.model.VisualAnalysis;
import com.comag10.crowdflower.model.VisualAnalysisDeliverable;
import com.comag10.crowdflower.model.WordRelevancyDeliverable;
import com.comag10.crowdflower.model.WordRelevancySentence;
import com.comag10.crowdflower.model.WordRelevancyWord;

public interface TaskDao {
	
	public List<Task> getAllTasks();
	public List<Task> getSituatedTasks(int categoryId);
	public List<Task> getLocationBasedTasks(int categoryId);
	public List<Task> getAnywhereTasks(int categoryId);
	public Task fetchTaskByName(String name);
	public ImageIdentification fetchRandomImageResource(int userId);
	public ImageIdentification fetchImageResourceById(int id);
	public Boolean submitImageIdentificationDeliverable(ImageIdentificationDeliverable deliverable);
	public VisualAnalysis fetchRandomVisualImageResource(int userId);
	public VisualAnalysis fetchVisualImageResourceById(int id);
	public Boolean submitVisualImageIdentificationDeliverable(VisualAnalysisDeliverable deliverable);
	public SentimentAnalysis fetchRandomSentimentResource(int userId);
	public SentimentAnalysis fetchSentimentResourceById(int id);
	public Boolean submitSentimentTaskDeliverable(SentimentAnalysisDeliverable deliverable);
	public WordRelevancySentence fetchRandomWordRelevancySentence(int userId);
	public Boolean submitWordRelevancyDeliverable(WordRelevancyDeliverable deliverable);
	public WordRelevancyWord fetchWordByWordId(int id);
	public WordRelevancySentence fetchSentenceBySentenceId(int id);
	public List<PlaceDescriptionQuestion> fetchAllQuestions();
	public Boolean submitPlaceDescriptionDeliverable(PlaceDescriptionDeliverable deliverable);
	public Location fetchRandomLocation();
	public Location fetchLocationById(int id);
	public Boolean submitOuluHobbiesDeliverable(OuluHobbiesDeliverable deliverable);
	public Boolean checkUserDeliverable(User user, String locationId);
	public Boolean checkUserSentimentAnalysisDeliverable(User user, String resourceId);
	public Boolean checkUserHobbiesDeliverable(User user);
	public Boolean checkUserWordRelevanceDeliverable(User user, String sentenceId);
	public Boolean checkUserImageIdentificationDeliverable(User user, String resourceId);
	public Boolean checkUserVisualAnalysisDeliverable(User user, String resourceId);
	public int getAllUserTasks(User user);
	public int getUserSituatedTasks(User user);
	public int getUserLocationBasedTasks(User user);
	public int getUserAnywhereTasks(User user);
	public int getUserImageIdentificationDeliveables(User user);
	public int getUserOuluhobbiesDeliveables(User user);
	public int getUserPlaceDescriptionDeliveables(User user);
	public int getUserWordRelevancyDeliveables(User user);
	public int getUserSentimentAnalysisDeliveables(User user);
	public int getUserVisualAnalysisDeliveables(User user);
	public HousingLocation fetchRandomHousingLocation(int userId);
	public HousingLocation fetchHousingLocationById(int id);
	public Boolean submitStudentHousingDeliverable(StudentHousingDeliverable deliverable);
	public Boolean submitNewHobby(Hobby hobby);
	public Hobby fetchRandomHobby(int userId);
	public List<ImageIdentificationDeliverable> fetchAllImageIdentificationDeliverables(int userId);
	public List<OuluHobbiesDeliverable> fetchAllOuluHobbiesDeliverables(int userId);
	public List<StudentHousingDeliverable> fetchAllStudentHousingDeliverables(int userId);
	
}