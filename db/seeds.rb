# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ror_tech = Technology.create(name: "Ruby on Rails", reviewer_name: "Jitendra")
php_tech = Technology.create(name: "PHP", reviewer_name: "Surya")
ui_tech = Technology.create(name: "UI", reviewer_name: "Vanshaj")
js_tech = Technology.create(name: "Javascript", reviewer_name: "Pratibha")
dotnet_tech = Technology.create(name: ".Net", reviewer_name: "Naxane")
r1 = Role.create(role_type: "admin")
r2 = Role.create(role_type: "candidate")
User.create(email: 'cuehunt@gmail.com',password: '12345678',password_confirmation: '12345678', full_name: 'Cue Hunt', confirmed_at: Time.now, role_id: r1.id, status: ACTIVE)

Technology.all.each do |tech|
  case tech.name
    when "Ruby on Rails"
      que = ror_tech.questions.create(title: "If you want to append an item to an array , what will be the standard method?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "arr << item"), is_correct: true},
              {answer: Answer.create(description: "arr.append(item)") },
              {answer: Answer.create(description: "arr.map(item.close)") },
              {answer: Answer.create(description: "arr.length = arr.length+1 arr[length-1] = item") }
          ]
      )

      que = ror_tech.questions.create(title: "Which of the following is class variable?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "my_variable")},
              {answer: Answer.create(description: "MY_VARIABLE") },
              {answer: Answer.create(description: "@my_variable") },
              {answer: Answer.create(description: "@@my_variable") , is_correct: true}
          ]
      )

      que = ror_tech.questions.create(title: "If you create PostController, where will Rails look for its template by default?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "app/views/posts") , is_correct: true},
              {answer: Answer.create(description: "app/views/templates") },
              {answer: Answer.create(description: "app/views") },
              {answer: Answer.create(description: "app/templates/posts")}
          ]
      )

      que = ror_tech.questions.create(title: "Which part of migration runs during rollback")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "self.down")},
              {answer: Answer.create(description: "the entire migration") },
              {answer: Answer.create(description: "self.up") },
              {answer: Answer.create(description: "Nothing") , is_correct: true}
          ]
      )

      que = ror_tech.questions.create(title: "Which command you will run to drop your database")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "database_drop")},
              {answer: Answer.create(description: "rake db:drop") , is_correct: true},
              {answer: Answer.create(description: "rake db:migrate") },
              {answer: Answer.create(description: "rake db:destroy")}
          ]
      )

      que = ror_tech.questions.create(title: "Which of these are standard directories in a rails application")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Db")},
              {answer: Answer.create(description: "app") },
              {answer: Answer.create(description: "lib") },
              {answer: Answer.create(description: "All") , is_correct: true}
          ]
      )

      que = ror_tech.questions.create(title: "What is the output of the following statement? nil.to_a")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "empty string")},
              {answer: Answer.create(description: "FALSE") },
              {answer: Answer.create(description: "0") },
              {answer: Answer.create(description: "empty array") , is_correct: true}
          ]
      )

      que = ror_tech.questions.create(title: "Which command you run to undo the last migration")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "rake db:rollback STEP = 5") , is_correct: true},
              {answer: Answer.create(description: "rake db:rollback 5") },
              {answer: Answer.create(description: "db:rollback 5") },
              {answer: Answer.create(description: "database_undo STEP = 5")}
          ]
      )

      que = ror_tech.questions.create(title: "Which of these statement will utilize  the gem named 'mygem'")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "instantiate 'mygem'")},
              {answer: Answer.create(description: "import 'mygem'") },
              {answer: Answer.create(description: "utilize 'mygem'") },
              {answer: Answer.create(description: "require 'mygem'") , is_correct: true}
          ]
      )

      que = ror_tech.questions.create(title: "Which of the following will interpolate within a string with the variable named monster")
      que.question_answers.create(
          [
              {answer: Answer.create(description: '"/monster"')},
              {answer: Answer.create(description: '"#{monster}"') , is_correct: true},
              {answer: Answer.create(description: "{monster}") },
              {answer: Answer.create(description: '"{monster}"')}
          ]
      )
    when "Javascript"
      que = js_tech.questions.create(title: "A proper scripting language is a")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "High level programming language") , is_correct: true},
              {answer: Answer.create(description: "Assembly level programming language") },
              {answer: Answer.create(description: "Machine level programming language") },
              {answer: Answer.create(description: "Low level programming language")}
          ]
      )
      que = js_tech.questions.create(title: "Consider the code snippet given below. var count = [1,,3]; What is the observation made?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "The omitted value takes “undefined”") , is_correct: true},
              {answer: Answer.create(description: "This results in an error") },
              {answer: Answer.create(description: "This results in an exception") },
              {answer: Answer.create(description: "None of the mentioned")}
          ]
      )
      que = ror_tech.questions.create(title: "The unordered collection of properties, each of which has a name and a value is called")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "String")},
              {answer: Answer.create(description: "Object") , is_correct: true},
              {answer: Answer.create(description: "Serialized Object") },
              {answer: Answer.create(description: "All of the above")}
          ]
      )
      que = js_tech.questions.create(title: "Consider the following code snippet. data.sort(function(a,b),b-a); What does the above code do?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Sort in the alphabetical order")},
              {answer: Answer.create(description: "Sort in the chronological order") },
              {answer: Answer.create(description: "Sort in reverse alphabetical order") },
              {answer: Answer.create(description: "Sort in reverse numerical order") , is_correct: true}
          ]
      )
      que = js_tech.questions.create(title: "What will be the reaction when a catch clause has no conditionals ?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Takes it to be 0")},
              {answer: Answer.create(description: "Takes it to be 1") },
              {answer: Answer.create(description: "Takes it to be true") , is_correct: true},
              {answer: Answer.create(description: "Takes it to be false")}
          ]
      )
      que = js_tech.questions.create(title: "How many default number methods are available in JavaScript?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "5")},
              {answer: Answer.create(description: "6") },
              {answer: Answer.create(description: "7") , is_correct: true},
              {answer: Answer.create(description: "8")}
          ]
      )
      que = js_tech.questions.create(title: "What are the events generated by the Node objects called?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "generators")},
              {answer: Answer.create(description: "emitters") , is_correct: true},
              {answer: Answer.create(description: "dispatchers") },
              {answer: Answer.create(description: "highevents")}
          ]
      )
      que = js_tech.questions.create(title: "The main difference between the variables declared with var and with let is")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "var is confined to a particular function but let is not")},
              {answer: Answer.create(description: "let is confined to a particular function but var is not") , is_correct: true},
              {answer: Answer.create(description: "var defines values based on conditions but let does not")},
              {answer: Answer.create(description: "None of the mentioned")}
          ]
      )
      que = js_tech.questions.create(title: "Which of the following is the definition for debugging?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Finding bugs")},
              {answer: Answer.create(description: "Finding bugs")},
              {answer: Answer.create(description: "Both a and b") , is_correct: true},
              {answer: Answer.create(description: "None of the mentioned")}
          ]
      )
      que = js_tech.questions.create(title: "Which of the following is the window that the Firefox sends the error messages to?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Bug Window")},
              {answer: Answer.create(description: "Error Issues") },
              {answer: Answer.create(description: "Error Window") },
              {answer: Answer.create(description: "Error Console") , is_correct: true}
          ]
      )

    when "PHP"

      que = php_tech.questions.create(title: "Which version of PHP introduced Try/catch Exception?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "PHP 4")},
              {answer: Answer.create(description: "PHP 5") , is_correct: true},
              {answer: Answer.create(description: "PHP 5.3") },
              {answer: Answer.create(description: "PHP 6")}
          ]
      )
      que = php_tech.questions.create(title: "Type Hinting was introduced in which version of PHP?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "PHP 4")},
              {answer: Answer.create(description: "PHP 5") , is_correct: true},
              {answer: Answer.create(description: "PHP 5.3") },
              {answer: Answer.create(description: "PHP 6")}
          ]
      )
      que = php_tech.questions.create(title: "The practice of creating objects based on predefined classes is often referred to as.")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "class creation")},
              {answer: Answer.create(description: "object creation") },
              {answer: Answer.create(description: "object instantiation") },
              {answer: Answer.create(description: "class instantiation") , is_correct: true}
          ]
      )
      que = php_tech.questions.create(title: "Which one of the following function is used to send a e-mail using PHP script")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "mail_send()")},
              {answer: Answer.create(description: "send_mail()") },
              {answer: Answer.create(description: "mailrr()") },
              {answer: Answer.create(description: "mail()") , is_correct: true}
          ]
      )
      que = php_tech.questions.create(title: "Which one of the following is the very first task executed by a session enabled page?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Delete the previous session")},
              {answer: Answer.create(description: "Start a new session") },
              {answer: Answer.create(description: "Check whether a valid session exists") , is_correct: true},
              {answer: Answer.create(description: "Handle the session")}
          ]
      )
      que = php_tech.questions.create(title: "Which of the following statements can be used to set the time zone in individual scripts?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "date_set_timezone(‘Europe/London’);")},
              {answer: Answer.create(description: "date_default_timezone_set(‘Europe/London’);") , is_correct: true},
              {answer: Answer.create(description: "date_set_default_timezone(‘Europe/London’);") },
              {answer: Answer.create(description: "date_default_timezone(‘Europe/London’);")}
          ]
      )
      que = php_tech.questions.create(title: "Which function was introduced to help automate the inclusion of class files?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "__load()")},
              {answer: Answer.create(description: "__preload()") },
              {answer: Answer.create(description: "__autoload()") , is_correct: true},
              {answer: Answer.create(description: "__inload()")}
          ]
      )
      que = php_tech.questions.create(title: "PHP 4 did not support instanceof. Instead, which function did it provide?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "is()")},
              {answer: Answer.create(description: "get_class()") },
              {answer: Answer.create(description: "is_a()") , is_correct: true},
              {answer: Answer.create(description: "is_the()")}
          ]
      )
      que = php_tech.questions.create(title: "Which two predefined variables are used to retrieve information from forms?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "$GET & $SET")},
              {answer: Answer.create(description: "$_GET & $_SET") , is_correct: true},
              {answer: Answer.create(description: "$__GET & $__SET") },
              {answer: Answer.create(description: "GET & SET")}
          ]
      )
      que = php_tech.questions.create(title: "You can extend the exception base class, but you cannot override any of the preceding methods because the are declared as")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "protected")},
              {answer: Answer.create(description: "final"), is_correct: true},
              {answer: Answer.create(description: "static") },
              {answer: Answer.create(description: "private")}
          ]
      )

    when ".Net"
      que = dotnet_tech.questions.create(title: "Which of the following validation control is used to ensure that an user does not skip a form entity field?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "CompareValidator")},
              {answer: Answer.create(description: "RequiredFieldValidator") , is_correct: true},
              {answer: Answer.create(description: "RangeValidator") },
              {answer: Answer.create(description: "RegularExpressionValidator") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following statements is correct about Managed Code?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Managed code is the code that is compiled by the JIT compilers.")},
              {answer: Answer.create(description: "Managed code is the code where resources are Garbage Collected.") },
              {answer: Answer.create(description: "Managed code is the code that runs on top of Windows.") },
              {answer: Answer.create(description: "Managed code is the code that is written to target the services of the CLR.") , is_correct: true}
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "NET class libraries"), is_correct: true},
              {answer: Answer.create(description: "Common Language Runtime") },
              {answer: Answer.create(description: "Common Language Infrastructure") },
              {answer: Answer.create(description: "Component Object Model") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following .NET components can be used to remove unused references from the managed heap?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Common Language Infrastructure")},
              {answer: Answer.create(description: "CLR") },
              {answer: Answer.create(description: "Garbage Collector") , is_correct: true},
              {answer: Answer.create(description: "Class Loader") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following assemblies can be stored in Global Assembly Cache?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Private Assemblies")},
              {answer: Answer.create(description: "Friend Assemblies") },
              {answer: Answer.create(description: "Shared Assemblies") , is_correct: true},
              {answer: Answer.create(description: "Public Assemblies") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Code that targets the Common Language Runtime is known as")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Unmanaged")},
              {answer: Answer.create(description: "Distributed") },
              {answer: Answer.create(description: "Legacy") },
              {answer: Answer.create(description: "Managed Code") , is_correct: true}
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following is the root of the .NET type hierarchy?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "System.Object"), is_correct: true},
              {answer: Answer.create(description: "System.Type") },
              {answer: Answer.create(description: "System.Base") },
              {answer: Answer.create(description: "System.Parent") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following are parts of the .NET Framework?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "The Common Language Runtime (CLR)")},
              {answer: Answer.create(description: "The Framework Class Libraries (FCL)") },
              {answer: Answer.create(description: "Both a and b") , is_correct: true},
              {answer: Answer.create(description: "None of the mentioned") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following security features can .NET applications avail? ")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "PIN Security")},
              {answer: Answer.create(description: "Code Access Security") , is_correct: true},
              {answer: Answer.create(description: "Authentication Security") },
              {answer: Answer.create(description: "Biorhythm Security") }
          ]
      )
      que = dotnet_tech.questions.create(title: "Which of the following statements is correct about the .NET Framework?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: ".NET Framework uses DCOM for achieving language interoperability.")},
              {answer: Answer.create(description: ".NET Framework is built on the DCOM technology.") },
              {answer: Answer.create(description: ".NET Framework uses DCOM for making transition between managed and unmanaged code.") , is_correct: true},
              {answer: Answer.create(description: ".NET Framework uses DCOM for creating unmanaged applications.") }
          ]
      )

    when "UI"
      que = ui_tech.questions.create(title: "Which of the following is golden rule for interface design?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Place the user in control")},
              {answer: Answer.create(description: "Reduce the user’s memory load") },
              {answer: Answer.create(description: "Make the interface consistent") },
              {answer: Answer.create(description: "All of the mentioned") , is_correct: true}
          ]
      )
      que = ui_tech.questions.create(title: "Which of the following is not a user interface design process?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "User, task, and environment analysis and modeling")},
              {answer: Answer.create(description: "Interface design") },
              {answer: Answer.create(description: "Knowledgeable, frequent users") , is_correct: true},
              {answer: Answer.create(description: "Interface validation") }
          ]
      )
      que = ui_tech.questions.create(title: "What incorporates data, architectural, interface, and procedural representations of the software?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "design model"), is_correct: true},
              {answer: Answer.create(description: "user’s model") },
              {answer: Answer.create(description: "mental image") },
              {answer: Answer.create(description: "system image") }
          ]
      )
      que = ui_tech.questions.create(title: "What combines the outward manifestation of the computer-based system , coupled with all supporting information that describe system syntax and semantics?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "mental image")},
              {answer: Answer.create(description: "interface design") },
              {answer: Answer.create(description: "system image") , is_correct: true},
              {answer: Answer.create(description: "interface validation") }
          ]
      )
      que = ui_tech.questions.create(title: "What is/are the main component / components of user interface?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Presentation language")},
              {answer: Answer.create(description: "Action language") },
              {answer: Answer.create(description: "Both [A] and [B]") , is_correct: true},
              {answer: Answer.create(description: "Only [A]") }
          ]
      )
      que = ui_tech.questions.create(title: "Natural language user interface can accept input in the form of")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "string command")},
              {answer: Answer.create(description: "speech") , is_correct: true},
              {answer: Answer.create(description: "image") },
              {answer: Answer.create(description: "none of these") }
          ]
      )
      que = ui_tech.questions.create(title: "Which of the following is not a design principle that allow the user to maintain control?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Provide for flexible interaction")},
              {answer: Answer.create(description: "Allow user interaction to be interrupt-able and undo-able") },
              {answer: Answer.create(description: "Show technical internals from the casual user") , is_correct: true},
              {answer: Answer.create(description: "Design for direct interaction with objects that appear on the screen") }
          ]
      )
      que = ui_tech.questions.create(title: "A software engineer designs the user interface by applying an iterative process that draws on.")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "predefined design principles"), is_correct: true},
              {answer: Answer.create(description: "design model") },
              {answer: Answer.create(description: "user’s model") },
              {answer: Answer.create(description: "system image") }
          ]
      )
      que = ui_tech.questions.create(title: "Which is correct?")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "<b>Click Here<b>")},
              {answer: Answer.create(description: "<strong>Click Here<strong>") },
              {answer: Answer.create(description: "<b>Click Here</b>") , is_correct: true},
              {answer: Answer.create(description: "</strong>Click Here</strong>") }
          ]
      )
      que = ui_tech.questions.create(title: "An HTML_____takes text in one format and changes it to HTML code.")
      que.question_answers.create(
          [
              {answer: Answer.create(description: "Browser")},
              {answer: Answer.create(description: "Editor") },
              {answer: Answer.create(description: "Converter – correct answer") , is_correct: true},
              {answer: Answer.create(description: "Processor") }
          ]
      )
  end
end