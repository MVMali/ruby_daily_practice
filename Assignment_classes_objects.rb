# Assignment_1: "Classes and Object"
# Student Information System
# Create a Ruby program that simulates a simple student information system. You should define a class Student with the following attributes:
# name (String): Name of the student.
# roll_number (Integer): Roll number assigned to the student.
# marks (Hash): A hash to store subject-wise marks (e.g., {"Math" => 90, "Science" => 85, "English" => 92}).
# Implement the following methods within the Student class:
# Display Information: Implement a method to display the student's information, including name, roll number, and subject-wise marks.
# Calculate Average: Implement a method to calculate and return the average marks of the student.


$courses = ["Math","Science","English"]

class School
  @@noOfSchoolsEnrolled = 0
  def initialize
    @@noOfSchoolsEnrolled += 1
  end
  def schoolInfo
    puts "Welcome to #{self} , We have best Teachers!!"
  end
  def getStudentInfo(student)
    student.getStudentInfo
  end

  def getAvg(student)
    student.getAvg
  end

  def self.AboutUs
    puts "Currently Number of Schools Enrolled = #{@@noOfSchoolsEnrolled}"
  end
end
#used here Polymorphism Duck-type


class Student

  @@nofOfStudentEnrolled = 0

  def initialize(name,roll_number)
    @name = name.to_s
    @roll_number = roll_number.to_i
    @@nofOfStudentEnrolled += 1
    @marksHash = {}

  end

  def addSubjectsWithScore
    $courses.each do |course|
      puts "Enter Score for #{course}"
      score = gets.chomp.to_i
      @marksHash.store(course,score)

    end
  end


  def getStudentInfo
    puts "Name: #{@name}"
    puts "Roll Number :#{@roll_number}"
    puts "\nSubject Scores"
    @marksHash.each do |key,value|
      puts "#{key} = #{value}"
    end


    # return @name,@roll_number,@marksHash
  end
  def getAvg
    noOfSubjects = @marksHash.length
    totalScore = 0
    @marksHash.each do |key,value|
      totalScore += value
    end

    if noOfSubjects!=0
    avgscore = 1.0*(totalScore/noOfSubjects)
    else return -1
    end

    # puts "Average Score #{avgscore}"
    return avgscore
  end

  def self.AboutUs
    puts "Currently Number of Students Enrolled = #{@nofOfStudentEnrolled}"
  end
end

patternSchool = School.new
s1 = Student.new("Mohan",0101)
s1.addSubjectsWithScore
s1.getStudentInfo
patternSchool.getStudentInfo(s1)
puts patternSchool.getAvg(s1)
# patternSchool.schoolInfo
# School.AboutUs
# Student.AboutUs
