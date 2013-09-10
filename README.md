UvAcoursesApp
=============

<p>Mobile web app with which users can shop for University of Amsterdam courses<p>

List of features of UvAcoursesApp:
<ul><i>
<li>supports courses from the Faculty of Science through data maintained from courses.xml.gz</li>
<li>enables users to browse courses</li>
<li>enables users to search for courses by keyword</li>
<li>enables users to see courses’ catalog numbers</li>
<li>enables users to add courses to lists</li>
<li>allows users to browses courses they’ve recently viewed</li>
</ul>

Technologies implemented:
<ul><i>
<li>HTML</li>
<li>CSS</li>
<li>jQuery</li>
<li>Ruby on Rails</li>
</ul>

Mockups:

<p><i>Welcome Page:</p>
<img src="/doc/Welcome_Page%20(1).png" alt="Welcome Page">
<p><i>Browsing_Courses Page:</p>
<img src="/doc/Browsing_Courses%20(2).png" alt="Browsing_Courses">
<p><i>Courses_I'm_shopping Page:</p>
<img src="/doc/Courses_I'm_shopping%20(3).png" alt="Courses_I'm_shopping">
<p><i>Courses_I'm_taking Page:</p>
<img src="/doc/Courses_I'm_taking%20(4).png" alt="Courses_I'm_taking">
<p><i>Recently_viewed Page:</p>
<img src="/doc/Recently_viewed%20(5).png" alt="Recently_viewed">
<p><i>Clicked_On_Course Page:</p>
<img src="/doc/Clicked_On_Course%20(6).png" alt="Clicked_On_Course">

<p>The way these are linked together:</p>

<ul>
<li>Welcome Page is linked to: <i>Browsing_Courses, Courses_I'm_shopping, Courses_I'm_taking, Recently_viewed</i></li>
<li>Browsing_Courses Page is linked to: <i>Courses_I'm_shopping, Courses_I'm_taking, Recently_viewed, Clicked_On_Course</i></li>
<li>Courses_I'm_shopping Page is linked to: <i>Browsing_Courses, Courses_I'm_taking, Recently_viewed, Clicked_On_Course</i></li>
<li>Courses_I'm_taking Page is linked to: <i>Browsing_Courses, Courses_I'm_shopping, Recently_viewed, Clicked_On_Course</i></li>
<li>Recently_viewed Page is linked to: <i>Browsing_Courses, Courses_I'm_shopping, Courses_I'm_taking, Clicked_On_Course</i></li>
<li>Clicked_On_Course is linked to: <i>Browsing_Courses, Courses_I'm_shopping, Courses_I'm_taking, Clicked_On_Course, Recently_viewed Pagev
</i></ul>
![Alt text](/doc/Links%20general.jpg "Optional title")


UvAcoursesApp is implemented by Attila Csala during App Studio 2013.
