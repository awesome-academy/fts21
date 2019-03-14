I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"has_many":"Cannot delete record because dependent %{record} exist","has_one":"Cannot delete record because a dependent %{record} exists"}}}},"activities":{"at":"At: ","create":"created","delete":"deleted","finish":"finished","no_activity":"There is no activity","report":"reported","start":"started","update":"updated"},"add":"Add","cancel":"Cancel","close":"Close","confirm":"Are you sure?","confirm_text":"Confirm","course_subjects":{"actived":"This subject of the course is being activated","finish_subject":"Finish subject","finish_success":"Finish the subject successfully","finished":"This subject of the course was finished","not_accepted":"Not accepted","not_active":"The course is not yet active","start_subject":"Start subject","start_success":"Start the subject successfully"},"courses":{"add_trainee":"Please select at least 1 person","all":"All courses","assign_trainee":"Assign trainee","assign_trainee_title":"Assign Trainee to course","back":"Back","btn_create":"Create course","btn_save":"Save course","content":"Content","course_active":"Courses active","course_close":"Course was closed","course_joined":"Courses joined","date_end":"End date","date_end_earlier_start":"The end date cannot be earlier than the start date","date_start":"Start date","delete_trainee_success":"Delete trainee successfully","description":"Description","edit":"Edit course","end_at":"End at: ","fail":"Fail!","finish":"Finish course","finish_course_not_allow":"Finish course is not allowed","finish_success":"Finish subject successfully","more_courses_active":"A trainee cannot operate at the same time in 2 different courses","name":"Name","new":"New course","no_course":"There are no courses","no_course_active":"No courses are active","no_course_joined":"No courses joined","no_subject":"The course has no subjects. Can't start!","no_trainee":"The course has no trainess. Can't start!","no_users_to_add":"No more users to add","not_allow_add_member":"Cannot add members when course is active or closed","not_found":"Course does not exist","not_user_on_course":"Trainee does not exist in the course","select_subject":"Select subject","select_suppervisor":"Select suppersivor","show":"Show course","start":"Start Course","start_at":"Start at: ","start_success":"The course is started","subject":"Subject","subjects":"Subjects","success":"Success!!","suppervisor":"Suppervisor","trainees":"Trainees"},"date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","last_attempt":"You have one more attempt before your account is locked.","locked":"Your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"email_changed":{"subject":"Email Changed"},"password_change":{"subject":"Password Changed"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.","updated":"Your account has been updated successfully.","updated_but_not_signed_in":"Your account has been updated successfully, but since your password was changed, you need to sign in again"},"sessions":{"already_signed_out":"Signed out successfully.","signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"disable_search_threshold":3,"errors":{"array?":"must be an array","attr?":"is missing","bool?":"must be boolean","connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","date?":"must be a date","date_time?":"must be a date time","decimal?":"must be a decimal","empty?":"must be empty","eql?":"must be equal to %{left}","even?":"must be even","excluded_from?":{"arg":{"default":"must not be one of: %{list}","range":"must not be one of: %{list_left} - %{list_right}"}},"excludes?":"must not include %{value}","exclusion?":"must not be one of: %{list}","false?":"must be false","filled?":"must be filled","float?":"must be a float","format":"%{attribute} %{message}","format?":"is in invalid format","gt?":"must be greater than %{num}","gteq?":"must be greater than or equal to %{num}","hash?":"must be a hash","included_in?":{"arg":{"default":"must be one of: %{list}","range":"must be one of: %{list_left} - %{list_right}"}},"includes?":"must include %{value}","inclusion?":"must be one of: %{list}","int?":"must be an integer","key?":"is missing","lt?":"must be less than %{num}","lteq?":"must be less than or equal to %{num}","max_size?":"size cannot be greater than %{num}","messages":{"accepted":"must be accepted","already_confirmed":"was already confirmed, please try signing in","blank":"can't be blank","confirmation":"doesn't match %{attribute}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","expired":"has expired, please request a new one","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","model_invalid":"Validation failed: %{errors}","not_a_number":"is not a number","not_an_integer":"must be an integer","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","required":"must exist","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"min_size?":"size cannot be less than %{num}","none?":"cannot be defined","not_eql?":"must not be equal to %{left}","number?":"must be a number","odd?":"must be odd","or":"or","size?":{"arg":{"default":"size must be %{size}","range":"size must be within %{size_left} - %{size_right}"},"value":{"string":{"arg":{"default":"length must be %{size}","range":"length must be within %{size_left} - %{size_right}"}}}},"str?":"must be a string","time?":"must be a time","true?":"must be true","type?":"must be %{type}","unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"destroy":{"alert":"%{resource_name} could not be destroyed.","notice":"%{resource_name} was successfully destroyed."},"update":{"notice":"%{resource_name} was successfully updated."}}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","update":"Update %{model}"}},"layouts":{"application":{"fts_title":"FTS","time_default":"%d/%m/%Y"},"footer":{"author":" Huu Hung ","copyright":"Copyright © 2019","email":"Email: huuhung1996@gmail.com","f_by":"By","title_about":"About","title_contact":"Contact","url_author":"http://fb.com/huuhunghienhoa"},"header":{"nav_account":"Account","nav_help":"Help","nav_home":"Home","nav_login":"Login","nav_logout":"Logout","nav_profile":"Profile","nav_setting":"Settings","nav_users":"Users","search":"Search..."}},"mailers":{"assign_trainee":{"body":"You have been added to course: ","title_subject":"You have been added to a new course"},"hi":"Hi ","remove_trainee":{"body":"You have been removed from course: ","title_subject":"You have been removed from a course"},"statistic":{"body":"List of trainees in the course: ","title_subject":"%{course} - Statistic of trainee at end of month"}},"not_found":"Not found","number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"eb":"EB","gb":"GB","kb":"KB","mb":"MB","pb":"PB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"password_resets":{"check_expiration":{"expired_password":"Password reset has expired."},"create":{"not_found_email":"Email address not found","sent_email_reset":"Email sent with password reset instructions"},"edit":{"confirm":"Confirmation","title":"Reset password","update_password":"Update password"},"new":{"submit":"Submit","title":"Forgot password"},"update":{"empty_password":"can't be empty","reset_password":"Password has been reset"}},"public":{"404":{"content1":"The page you were looking for doesn't exist.","content2":"You may have mistyped the address or the page may have moved.","content3":"If you are the application owner check the logs for more information.","title":"The page you were looking for doesn't exist (404)"},"422":{"content1":"The change you wanted was rejected.","content2":"Maybe you tried to change something you didn't have access to.","content3":"If you are the application owner check the logs for more information.","title":"The change you wanted was rejected (422)"},"500":{"content1":"We're sorry, but something went wrong.","content2":"If you are the application owner check the logs for more information.","title":"We're sorry, but something went wrong (500)"}},"sessions":{"create":{"account_not_activated":"Account not activated. Check your email for the activation link.","login_error":"Invalid email/password combination"},"logged":"You are logged in","new":{"login":"Log in","new_user":"New user?","remember_me":"Remember me on this computer","sign_up":"Sign up now!","type_email":"Type email","type_password":"Type password"},"not_access":"You do not have access"},"shared":{"error_messages":{"error":"error","form_error":"The form contains"},"sidebar":{"all_courses":"All courses","all_subjects":"All subjects","courses":"Courses","new_course":"Create course","new_subject":"New subject"}},"static_pages":{"about":{"title":"About"},"contact":{"body":"Contact the Ruby on Rails Tutorial about the sample app at the","title":"Contact","title_contact":"contact page"},"help":{"title":"Help"},"home":{"title":"Home"}},"subjects":{"all":"All subjects","back":"Back","btn_create":"Create subject","btn_save":"Save subject","description":"Description","edit":"Edit subject","has_tasks":"This subject has: ","list_tasks":"List tasks of subject","name":"Name","new":"New subject","no_courses":"No courses","no_subject":"There are no subjects","not_found":"Subject does not exist","number_task":"#Task ","one_task":"1","select_suppervisor":"Select suppersivor","show":"Show subject","subject":{"create_fail":"Create a failed subject","create_success":"Create a successful subject","update_fail":"Update a failed subject","update_success":"Update a successful subject"},"suppervisor":"Suppervisor","task":{"add_more":"Add more task","belong_courses":"Belong to the courses","close":"Close","confirm_save":"You need click save to confirm the change","create_success":"Create a successful task","delete_fail":"Delete failed task","delete_success":"Delete successful task","description":"Description","name":"Name","new":"New task","no_tasks":"There are no tasks","not_accept":"Action is not accepted","not_found":"Task does not exist","remove":"Remove","save":"Save","update_success":"Update a successful task"},"tasks":" tasks","time_day":"Time_day"},"support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"time":{"am":"am","formats":{"default":"%d/%m/%Y","long":"%B %d, %Y %H:%M","own":"%H:%M:%S, %d %B","short":"%d %b %H:%M"},"pm":"pm"},"user_subjects":{"finish_fail":"Finish the subject failed","finish_success":"Finish the subject successfully","finished":"The subject has been completed","not_active":"The subject has not been activated by the supervisor","subject_inactive":"The subject is inactive","task":{"at":"At","cant_report":"Subject has not been activated yet. You cannot report this task","completed":"Completed","finish":"Finish","finish_fail":"Finish the task failed","finish_success":"Finish task successfully","finished":"Task has been completed","not_accepted":"Not accepted","progress":"Progress","receive_at":"Receive at: ","received":"Tasks received","report":"Report","report_fail":"Report task failed","report_success":"Report task successfully","reported":"You have already reported this task"}},"users":{"correct_user":{"mess_permission":"You do not have permission to edit other people's information"},"create":{"check_email":"Please check your email to activate your account."},"destroy":{"mess_fail":"Deleting user failed","mess_success":"User deleted"},"edit":{"btn_save":"Save changes","change":"Change","h1":"Update your profile","title":"Edit user"},"index":{"all_users":"All user"},"logged_in_user":{"mess_error":"Please log in."},"new":{"create_account":"Create my account","p_content":"This will be a signup page for new users.","pass_confirm":"Confirmation","sign_up":"Sign up"},"update":{"mess_fail":"Updating information failed","mess_success":"Profile updated"},"user":{"delete":"delete","mess_confirm":"You sure?"}},"will_paginate":{"next_label":"\u0026#8594;","page_entries_info":{"multi_page":"Displaying %{model} %{from} - %{to} of %{count} in total","multi_page_html":"Displaying %{model} \u003cb\u003e%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003c/b\u003e of \u003cb\u003e%{count}\u003c/b\u003e in total","single_page":{"one":"Displaying 1 %{model}","other":"Displaying all %{count} %{model}","zero":"No %{model} found"},"single_page_html":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{model}","other":"Displaying \u003cb\u003eall\u0026nbsp;%{count}\u003c/b\u003e %{model}","zero":"No %{model} found"}},"page_gap":"\u0026hellip;","previous_label":"\u0026#8592;"}});
