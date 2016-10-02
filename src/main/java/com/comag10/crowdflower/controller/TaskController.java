package com.comag10.crowdflower.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.model.Hobby;
import com.comag10.crowdflower.model.HousingLocation;
import com.comag10.crowdflower.model.ImageIdentification;
import com.comag10.crowdflower.model.ImageIdentificationData;
import com.comag10.crowdflower.model.ImageIdentificationDeliverable;
import com.comag10.crowdflower.model.Location;
import com.comag10.crowdflower.model.OuluHobbiesDeliverable;
import com.comag10.crowdflower.model.PlaceDescriptionDeliverable;
import com.comag10.crowdflower.model.SentimentAnalysis;
import com.comag10.crowdflower.model.SentimentAnalysisDeliverable;
import com.comag10.crowdflower.model.StudentHousingDeliverable;
import com.comag10.crowdflower.model.Survey;
import com.comag10.crowdflower.model.Task;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.model.VisualAnalysis;
import com.comag10.crowdflower.model.VisualAnalysisData;
import com.comag10.crowdflower.model.VisualAnalysisDeliverable;
import com.comag10.crowdflower.model.WordRelevancyDeliverable;
import com.comag10.crowdflower.model.WordRelevancySentence;
import com.comag10.crowdflower.model.WordRelevancyWord;
import com.comag10.crowdflower.service.TaskService;
import com.comag10.crowdflower.service.UserService;
import com.comag10.crowdflower.shared.Constants;

@Controller
public class TaskController {	

	String imgIdentificationStartTime 	= "";
	String visualAnalysisStartTime 		= "";
	String sentimentAnalysisStartTime 	= "";
	String wordRelevancyStartTime 		= "";
	String placeDescriptionStartTime	= "";
	String ouluHobbiesStartTime			= "";
	String studentHousingStartTime		= "";
	String addNewHobbyStartTime			= "";

	@Autowired
	private TaskService taskService;

	@Autowired
	private UserService userService;

	@Autowired(required=true)
	@Qualifier(value="TaskService")
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}

	@Autowired(required=true)
	@Qualifier(value="UserService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/situated", method = RequestMethod.GET)
	public String situated(ModelMap model) {
		List<Task> situatedTasks = this.taskService.getSituatedTasks(1);
		model.addAttribute("taskList", situatedTasks);
		return "situated";
	}

	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location(ModelMap model) {
		List<Task> locationBasedTask = this.taskService.getLocationbasedTasks(2);
		model.addAttribute("taskList", locationBasedTask);
		return "location";
	}

	@RequestMapping(value = "/anywhere", method = RequestMethod.GET)
	public String anywhere(ModelMap model, Principal principal) {
		List<Task> anywhereTask = this.taskService.getAnywhereTasks(3);
		
		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);
		
		Boolean isSurveySubmitted = this.taskService.checkUserSurvey(user);
		
		System.out.println("survey submitted is = "+isSurveySubmitted);
		
		if(isSurveySubmitted)
			model.addAttribute("isSurveySubmitted", "true");
		else 
			model.addAttribute("isSurveySubmitted", "false");

		model.addAttribute("taskList", anywhereTask);
		
		return "anywhere";
	}
	
	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public String survey(ModelMap model, Principal principal) {
		return "survey";
	}
	
	@ResponseBody
	@RequestMapping(value = "/survey-post", method = RequestMethod.POST)
	public String surveyPost(ModelMap model, 
							Principal principal,
							@RequestParam("gender") String gender,
							@RequestParam("age") String age,
							@RequestParam("education") String education,
							@RequestParam("fieldStudy") String fieldStudy,
							@RequestParam("living") String living,
							@RequestParam("isCrowdsourcingWorker") String isCrowdsourcingWorker,
							@RequestParam("isReserved") String isReserved,
							@RequestParam("isGenerallyTrusting") String isGenerallyTrusting,
							@RequestParam("lazy") String lazy,
							@RequestParam("isRelaxed") String isRelaxed,
							@RequestParam("artisticInterests") String artisticInterests,
							@RequestParam("isSociable") String isSociable,
							@RequestParam("findFaults") String findFaults,
							@RequestParam("job") String job,
							@RequestParam("nervous") String nervous,
							@RequestParam("activeImagination") String activeImagination
							) {
		
		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);
		
		System.out.println("value of age is = "+age);
		
		Survey survey = new Survey();
		
		survey.setGender(gender);
		survey.setAge(age);
		survey.setEducation(Integer.parseInt(education));
		survey.setField_study(Integer.parseInt(fieldStudy));
		survey.setLiving(Integer.parseInt(living));
		survey.setIs_crowdsourcing_worker(Integer.parseInt(isCrowdsourcingWorker));
		survey.setIs_reserved(Integer.parseInt(isReserved));
		survey.setIs_generally_trusting(Integer.parseInt(isGenerallyTrusting));
		survey.setLazy(Integer.parseInt(lazy));
		survey.setRelaxed(Integer.parseInt(isRelaxed));
		survey.setArtistic_interest(Integer.parseInt(artisticInterests));
		survey.setSociable(Integer.parseInt(isSociable));
		survey.setFind_faults(Integer.parseInt(findFaults));
		survey.setThorough_job(Integer.parseInt(job));
		survey.setNervous(Integer.parseInt(nervous));
		survey.setActive_imagination(Integer.parseInt(activeImagination));
		survey.setFk_user_id(user.getId());
		
		try {
			this.taskService.addNewUserSurveyDeliverable(survey);

			return "{\"status\":\"200\", \"message\":\"Your survey has been submitted.\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}
	}

	@RequestMapping(value = "/imageidentification", method = RequestMethod.GET)
	public String imageIdentification(ModelMap model, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);

		imgIdentificationStartTime = Utils.getCurrentTime();

		System.out.println("image identification start time "+ imgIdentificationStartTime);

		Task task = this.taskService.getTaskByName("Image Identification");
		model.addAttribute("task", task);

		ImageIdentification imageidentification = this.taskService.getRandomImageIdentificationResource(user.getId());

		if( imageidentification==null )
			model.addAttribute("resource", "");
		else
			model.addAttribute("resource", imageidentification);

		return "imageidentification";
	}

	@RequestMapping(value = "/visual-analysis", method = RequestMethod.GET)
	public String visualAnalysis(ModelMap model, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);
		
		visualAnalysisStartTime = Utils.getCurrentTime();

		System.out.println("visual analysis start date " + visualAnalysisStartTime);

		Task task = this.taskService.getTaskByName("Visual Analysis");
		model.addAttribute("task", task);

		VisualAnalysis visualImageAnalysis = this.taskService.getRandomVisualAnalysisResource(user.getId());
		
		if( visualImageAnalysis==null )
			model.addAttribute("resource", "");
		else
			model.addAttribute("resource", visualImageAnalysis);

		return "visual-analysis";
	}

	@RequestMapping(value = "/sentiment-analysis", method = RequestMethod.GET)
	public String sentimentAnalysis(ModelMap model, Principal principal) {
		
		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
				
		sentimentAnalysisStartTime = Utils.getCurrentTime();

		System.out.println("sentiment analysis start date " + sentimentAnalysisStartTime);

		Task task = this.taskService.getTaskByName("Sentiment Analysis");
		model.addAttribute("task", task);

		SentimentAnalysis sentimentAnalysis = this.taskService.getRandomSentimentAnalysisResource(user.getId());
		
		if(sentimentAnalysis==null) {
			model.addAttribute("resource", "");
		} else {
			sentimentAnalysis.setSentence(sentimentAnalysis.getSentence().trim());
			model.addAttribute("resource", sentimentAnalysis);
		}

		return "sentiment-analysis";
	}

	@RequestMapping(value = "/word-relevancy", method = RequestMethod.GET)
	public String wordRelevance(ModelMap model, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
				
		wordRelevancyStartTime = Utils.getCurrentTime();

		System.out.println("start time in word relevancy "+wordRelevancyStartTime);

		Task task = this.taskService.getTaskByName("Word Relevance");
		model.addAttribute("task", task);

		WordRelevancySentence sentence = this.taskService.getRandomWordRelevancySentence(user.getId());
		
		if(sentence==null) {
			model.addAttribute("resource", "");
		} else {
			model.addAttribute("resource", sentence);
		}

		return "word-relevancy";
	}

	@RequestMapping(value = "/place-description", method = RequestMethod.GET)
	public String placeDescription(ModelMap model, Principal principal) {
		
		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
		
		placeDescriptionStartTime = Utils.getCurrentTime();

		System.out.println("place description start date " + placeDescriptionStartTime);

		Task task = this.taskService.getTaskByName("Describe the place");
		model.addAttribute("task", task);

		//get the location.
		Location location = this.taskService.getRandomLocation(user);
		if(location==null) {
			model.addAttribute("location", "");
		} else {
			model.addAttribute("location", location);
		}

		return "place-description";
	}

	@RequestMapping(value = "/student-housing", method = RequestMethod.GET)
	public String studentHousing(ModelMap model, Principal principal) {
		
		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
				
		studentHousingStartTime = Utils.getCurrentTime();

		System.out.println("student housing start date " + studentHousingStartTime);

		Task task = this.taskService.getTaskByName("Student Housing");
		model.addAttribute("task", task);

		//get the housing location.
		HousingLocation location = this.taskService.getRandomHousingLocation(user.getId());
		if(location==null) {
			model.addAttribute("location", "");
		} else {
			model.addAttribute("location", location);
		}
		
		return "studenthousing";
	}

	@ResponseBody
	@RequestMapping(value = "/studenthousing-post", method = RequestMethod.POST)
	public String studentHousingPostData(ModelMap model,
			Principal principal,
			@RequestParam("housingLocationId") String housingLocationId,
			@RequestParam("cleanliness") String cleanliness,
			@RequestParam("nearbyServices") String nearbyServices,
			@RequestParam("location") String location,
			@RequestParam("cost") String cost,
			@RequestParam("internet") String internet,
			@RequestParam("maintenance") String maintenance,
			@RequestParam("isSkipped") String isSkipped,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);

		//need to change as per the discussion.
		/*Boolean isUserDeliverableExist = this.taskService.checkUserDeliverable(user, locationId);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";
		 */
		String studentHousingEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(studentHousingStartTime, studentHousingEndTime);

		System.out.println("place description start date " + studentHousingStartTime);
		System.out.println("place description end date " + studentHousingEndTime);

		System.out.println("user id is " + user.getId());
		System.out.println("housing location id is " + housingLocationId);
		System.out.println("cleanliness " + cleanliness);
		System.out.println("nearbyServices " + nearbyServices);
		System.out.println("location " + location);
		System.out.println("cost " + cost);
		System.out.println("internet " + internet);
		System.out.println("maintenance " + maintenance);
		System.out.println("isSkipped " + isSkipped);
		System.out.println("timeTaken " + timeTaken);
		System.out.println("date " + Utils.getCurrentTime());


		//get location by location id.
		HousingLocation locationObj = this.taskService.getHousingLocationById(Integer.parseInt(housingLocationId));

		StudentHousingDeliverable deliverable = new StudentHousingDeliverable();

		deliverable.setFk_user_id(user.getId());
		deliverable.setFk_housing_location_id(Integer.parseInt(housingLocationId));
		deliverable.setCleanliness(Integer.parseInt(cleanliness));
		deliverable.setNearby_services(Integer.parseInt(nearbyServices));
		deliverable.setLocation(Integer.parseInt(location));
		deliverable.setCost(Integer.parseInt(cost));
		deliverable.setInternet(Integer.parseInt(internet));
		deliverable.setMaintenance(Integer.parseInt(maintenance));
		deliverable.setIs_skipped(Integer.parseInt(isSkipped));
		deliverable.setTime_taken(timeTaken);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewStudentHousingDeliverable(deliverable);

			//skip coin management if the user skipped the task.
			if( isSkipped.equals("1") )
				this.userService.updateUserBalance(user, Constants.STUDENT_HOUSING_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}";
		} catch(Exception e) {

			e.printStackTrace();

			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}
	}

	@RequestMapping(value = "/oulu-hobbies", method = RequestMethod.GET)
	public String ouluHobbies(ModelMap model, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);

		ouluHobbiesStartTime = Utils.getCurrentTime();

		System.out.println("oulu hobbies start time "+ ouluHobbiesStartTime);

		Task task = this.taskService.getTaskByName("Hobbies in Oulu");
		model.addAttribute("task", task);

		Hobby hobby = this.taskService.getRandomHobby(user.getId());
		
		if( hobby==null ) {
			model.addAttribute("resource", "");
		} else {
			model.addAttribute("resource", hobby);
		}

		return "oulu-hobbies";
	}

	@ResponseBody
	@RequestMapping(value = "/ouluhobbies-post", method = RequestMethod.POST)
	public String ouluHobbiesPostData(ModelMap model, 
			@RequestParam("answer") String answer,
			@RequestParam("hobbyId") String hobbyId,
			@RequestParam("isSkipped") String isSkipped,
			Principal principal,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);

		/*Boolean isUserDeliverableExist = this.taskService.checkUserHobbiesDeliverable(user);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";
		 */
		System.out.println("in task controller post");
		String ouluHobbiesEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(ouluHobbiesStartTime, ouluHobbiesEndTime);

		System.out.println("oulu hobbies start date " + ouluHobbiesStartTime);
		System.out.println("oulu hobbies end date " + ouluHobbiesEndTime);

		OuluHobbiesDeliverable deliverable = new OuluHobbiesDeliverable();

		deliverable.setAnswer(answer);
		deliverable.setCreated(Utils.getCurrentTime());
		deliverable.setFk_hobby_id(Integer.parseInt(hobbyId));
		deliverable.setFk_user_id(user.getId());
		deliverable.setSkipped(Integer.parseInt(isSkipped));
		deliverable.setTime_taken(timeTaken);


		try{
			this.taskService.addNewOuluHobbiesDeliverable(deliverable);

			if(isSkipped.equals("0"))
				this.userService.updateUserBalance(user, Constants.HOBBIES_IN_OULU_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}	
	}

	@RequestMapping(value = "/newhobby", method = RequestMethod.GET)
	public String addNewHobby(ModelMap model) {
		addNewHobbyStartTime = Utils.getCurrentTime();

		return "newhobby";
	}

	@ResponseBody
	@RequestMapping(value = "/newhobby-post", method = RequestMethod.POST)
	public String addNewHobbyPostData(ModelMap model, @RequestParam("name") String name, Principal principal) {

		String addNewHobbyEndTime = Utils.getCurrentTime();
		long timeTaken = Utils.getTimeDifference(addNewHobbyStartTime, addNewHobbyEndTime);

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);

		Hobby hobby = new Hobby();

		hobby.setName(name);
		hobby.setFk_user_id(user.getId());
		hobby.setCreated(Utils.getCurrentTime());
		hobby.setStatus(0);
		hobby.setTime_taken(timeTaken);


		System.out.println("name is "+ name);
		System.out.println("user id is "+ user.getId());
		System.out.println("created is "+ Utils.getCurrentTime());
		System.out.println("status is "+ 0);
		System.out.println("time taken is "+ timeTaken);

		try {
			this.taskService.addNewHobby(hobby);

			return "{\"status\":\"200\", \"message\":\"Hobby has been posted for the admin to approve.\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}

	}


	@ResponseBody
	@RequestMapping(value = "/placedescription-post", method = RequestMethod.POST)
	public String placeDescriptionPostData(ModelMap model, Principal principal, @RequestParam("locationId") String locationId, @RequestParam("crowd") String crowdy, @RequestParam("easylocation") String easylocation, @RequestParam("weather") String weather, @RequestParam("traffic") String traffic, @RequestParam("noise") String noisy, @RequestParam("services") String service, @RequestParam("localfood") String localfood, HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);

		Boolean isUserDeliverableExist = this.taskService.checkUserDeliverable(user, locationId);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";

		String placeDescriptionEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(placeDescriptionStartTime, placeDescriptionEndTime);

		System.out.println("place description start date " + placeDescriptionStartTime);
		System.out.println("place description end date " + placeDescriptionEndTime);

		//get location by location id.
		Location locationObj = this.taskService.getLocationById(Integer.parseInt(locationId));

		PlaceDescriptionDeliverable deliverable = new PlaceDescriptionDeliverable();

		deliverable.setAvailableservices(Integer.parseInt(service));
		deliverable.setCrowdedness(Integer.parseInt(crowdy));
		deliverable.setFk_user_id(user);
		deliverable.setLocalrestaurant(localfood);
		deliverable.setLocationeasytofind(Integer.parseInt(easylocation));
		deliverable.setNoise(Integer.parseInt(noisy));
		deliverable.setTime_taken(timeTaken);
		deliverable.setTrafficsituation(Integer.parseInt(traffic));
		deliverable.setWeather(Integer.parseInt(weather));
		deliverable.setLocationDeliverable(locationObj);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewPlaceDescriptionDeliverable(deliverable);
			this.userService.updateUserBalance(user, Constants.DESCRIBE_THE_LOCATION_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/wordrelevancy-post", method = RequestMethod.POST)
	public String wordRelevancePostData(ModelMap model, 
			@RequestParam("answer") String answer,
			@RequestParam("sentence") String sentenceId,
			@RequestParam("isSkipped") String isSkipped,
			@RequestParam("isCorrect") String isCorrect,
			Principal principal,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);

		Boolean isDeliverableExists = this.taskService.checkUserWordRelevanceDeliverable(user, sentenceId);
		if( isDeliverableExists )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";

		String wordRelevanceEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(wordRelevancyStartTime, wordRelevanceEndTime);
		
		WordRelevancyDeliverable deliverable = new WordRelevancyDeliverable();

		if(answer.equals("")) {
			deliverable.setWord(null);
		} else {
			WordRelevancyWord word = this.taskService.getWordByWordId(Integer.parseInt(answer));
			deliverable.setWord(word);
		}

		WordRelevancySentence sentence = this.taskService.getSentenceBySentenceId(Integer.parseInt(sentenceId));

		deliverable.setFk_user_id(user);
		deliverable.setSentence(sentence);
		deliverable.setSkipped(Integer.parseInt(isSkipped));
		if(!isCorrect.equals(""))
			deliverable.setIsCorrect(Integer.parseInt(isCorrect));
		deliverable.setTime_taken(timeTaken);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewWordRelevancyDeliverable(deliverable);

			if(isSkipped.equals("0"))
				this.userService.updateUserBalance(user, Constants.WORD_RELEVANCY_COINS);

			return "{\"status\":\"200\", \"message\":\"deliverable inserted successfully\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/imageidentification-post", method = RequestMethod.POST)
	public String imageIdentificationPostData(ModelMap model,
			@ModelAttribute ImageIdentificationData data,
			Principal principal,
			@RequestParam("suggestedName") String suggestedName,
			@RequestParam("resourceId") String resourceId,
			@RequestParam("isSkipped") String isSkipped,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);

		Boolean isUserDeliverableExist = this.taskService.checkUserImageIdentificationDeliverable(user, resourceId);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";

		String imgIdentificationEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(imgIdentificationStartTime, imgIdentificationEndTime);

		//get resource by resource id for task deliverable.
		ImageIdentification imageResource = this.taskService.getImageIdentificationResourceById(Integer.parseInt(resourceId));

		ImageIdentificationDeliverable deliverable = new ImageIdentificationDeliverable();

		deliverable.setFk_user_id(user);
		deliverable.setResource_id(imageResource);
		deliverable.setSuggested_name(suggestedName);
		deliverable.setSkipped(Integer.parseInt(isSkipped));
		deliverable.setTime_taken(timeTaken);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewImageIdentificationResourceDeliverable(deliverable);

			if(isSkipped.equals("0"))
				this.userService.updateUserBalance(user, Constants.IMAGE_IDENTIFICATON_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}"; 
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/visualanalysis-post", method = RequestMethod.POST)
	public String visualAnalysisPostData(ModelMap model,
			@ModelAttribute VisualAnalysisData data,
			@RequestParam("suggestedLocation") String suggestedLocation,
			@RequestParam("resourceId") String resourceId,
			@RequestParam("isSkipped") String isSkipped,
			@RequestParam("isCorrect") String isCorrect,
			Principal principal,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);

		Boolean isUserDeliverableExist = this.taskService.checkUserVisualAnalysisDeliverable(user, resourceId);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";

		String visualAnalysisEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(visualAnalysisStartTime, visualAnalysisEndTime);

		//get resource by resource id for task deliverable.
		VisualAnalysis imageResource = this.taskService.getVisualAnalysisResourceById(Integer.parseInt(resourceId));

		VisualAnalysisDeliverable deliverable = new VisualAnalysisDeliverable();

		deliverable.setFk_user_id(user);
		deliverable.setResource_id(imageResource);
		deliverable.setAnswer(suggestedLocation);
		deliverable.setSkipped(Integer.parseInt(isSkipped));
		if(!isCorrect.equals(""))
			deliverable.setIsCorrect(Integer.parseInt(isCorrect));
		deliverable.setTime_taken(timeTaken);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewVisualAnalysisResourceDeliverable(deliverable);

			if(isSkipped.equals("0"))
				this.userService.updateUserBalance(user, Constants.VISUAL_ANALYSIS_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}

	}

	@ResponseBody
	@RequestMapping(value = "/sentimentanalysis-post", method = RequestMethod.POST)
	public String sentimentAnalysisPostData(ModelMap model, 
			Principal principal, 
			@RequestParam("resourceId") String resourceId, 
			@RequestParam("sentiment") String sentiment,
			@RequestParam("isSkipped") String isSkipped,
			@RequestParam("isCorrect") String isCorrect,
			HttpServletResponse response) {

		//get current user id from user info.
		String username = principal.getName();
		User user 		= this.userService.getUserByUsername(username);

		Boolean isUserDeliverableExist = this.taskService.checkUserSentimentAnalysisDeliverable(user, resourceId);

		if( isUserDeliverableExist )
			return "{\"status\":\"405\", \"message\":\"You have already submitted the deliverable, Proceed to other tasks.\"}";

		String sentimentAnalysisEndTime = Utils.getCurrentTime();

		long timeTaken = Utils.getTimeDifference(sentimentAnalysisStartTime, sentimentAnalysisEndTime);

		//get resource by resource id for task deliverable.
		SentimentAnalysis sentimentResource = this.taskService.getSentimentAnalysisResourceById(Integer.parseInt(resourceId));

		SentimentAnalysisDeliverable deliverable = new SentimentAnalysisDeliverable();

		deliverable.setFk_user_id(user);
		deliverable.setResource_id(sentimentResource);
		deliverable.setAnswer(Integer.parseInt(sentiment));
		deliverable.setSkipped(Integer.parseInt(isSkipped));
		
		if(!isCorrect.equals(""))
			deliverable.setIsCorrect(Integer.parseInt(isCorrect));
		deliverable.setTime_taken(timeTaken);
		deliverable.setCreated(Utils.getCurrentTime());

		try {
			this.taskService.addNewSentimentAnalysisResourceDeliverable(deliverable);

			if(isSkipped.equals("0"))
				this.userService.updateUserBalance(user, Constants.SENTIMENT_ANALYSIS_COINS);

			return "{\"status\":\"200\", \"message\":\"message inserted successfully\"}";
		} catch(Exception e) {
			return "{\"status\":\"405\", \"message\":\""+e.getMessage()+"\"}";
		}

	}


	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(ModelMap model, Principal principal) {

		User user = this.userService.getUserByUsername(principal.getName());

		int situatedCount = this.taskService.getUserSituatedTasks(user);
		int locationCount = this.taskService.getUserLocationBasedTasks(user);
		int anywhereCount = this.taskService.getUserAnywhereTasks(user);

		int totalTasksCount = situatedCount+locationCount+anywhereCount;

		model.addAttribute("user", user);
		model.addAttribute("situatedCount", situatedCount);
		model.addAttribute("locationCount", locationCount);
		model.addAttribute("anywhereCount", anywhereCount);
		model.addAttribute("totalTasksCount", totalTasksCount);

		return "profile";
	}

	@RequestMapping(value = "/wordrelevancy", method = RequestMethod.GET)
	public String wordRelevancy(ModelMap model) {
		return "wordrelevancy";
	}

	@RequestMapping(value = "/wordtranslation", method = RequestMethod.GET)
	public String wordTranslation(ModelMap model) {
		return "wordtranslation";
	}
}