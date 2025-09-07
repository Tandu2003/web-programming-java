<%@ page import="iuh.fit.se.tuan03.entities.Student" %> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Registration Result</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 20px;
      }
      .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
      }
      .result-section {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
        border-left: 4px solid #4caf50;
      }
      .result-section h3 {
        margin-top: 0;
        color: #4caf50;
      }
      .field {
        margin-bottom: 10px;
      }
      .field label {
        font-weight: bold;
        color: #555;
        display: inline-block;
        width: 150px;
      }
      .field span {
        color: #333;
      }
      .qualification-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
      }
      .qualification-table th,
      .qualification-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      .qualification-table th {
        background-color: #f2f2f2;
      }
      .back-button {
        text-align: center;
        margin-top: 30px;
      }
      .back-button a {
        background-color: #4caf50;
        color: white;
        padding: 12px 30px;
        text-decoration: none;
        border-radius: 4px;
        display: inline-block;
      }
      .back-button a:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Registration Successful!</h1>

      <!-- Using jsp:useBean to get the student object -->
      <jsp:useBean
        id="student"
        class="iuh.fit.se.tuan03.entities.Student"
        scope="request"
      />

      <!-- Personal Information Section -->
      <div class="result-section">
        <h3>Personal Information</h3>
        <div class="field">
          <label>First Name:</label>
          <span><jsp:getProperty name="student" property="firstName" /></span>
        </div>
        <div class="field">
          <label>Last Name:</label>
          <span><jsp:getProperty name="student" property="lastName" /></span>
        </div>
        <div class="field">
          <label>Date of Birth:</label>
          <span><jsp:getProperty name="student" property="birthday" /></span>
        </div>
        <div class="field">
          <label>Email:</label>
          <span><jsp:getProperty name="student" property="email" /></span>
        </div>
        <div class="field">
          <label>Mobile Number:</label>
          <span
            ><jsp:getProperty name="student" property="mobileNumber"
          /></span>
        </div>
        <div class="field">
          <label>Gender:</label>
          <span><jsp:getProperty name="student" property="gender" /></span>
        </div>
      </div>

      <!-- Contact Information Section -->
      <div class="result-section">
        <h3>Contact Information</h3>
        <div class="field">
          <label>Address:</label>
          <span><jsp:getProperty name="student" property="address" /></span>
        </div>
        <div class="field">
          <label>City:</label>
          <span><jsp:getProperty name="student" property="city" /></span>
        </div>
        <div class="field">
          <label>Pin Code:</label>
          <span><jsp:getProperty name="student" property="pinCode" /></span>
        </div>
        <div class="field">
          <label>State:</label>
          <span><jsp:getProperty name="student" property="state" /></span>
        </div>
        <div class="field">
          <label>Country:</label>
          <span><jsp:getProperty name="student" property="country" /></span>
        </div>
      </div>

      <!-- Hobbies Section -->
      <div class="result-section">
        <h3>Hobbies</h3>
        <div class="field">
          <label>Hobbies:</label>
          <span
            ><jsp:getProperty name="student" property="hobbiesString"
          /></span>
        </div>
      </div>

      <!-- Course Application Section -->
      <div class="result-section">
        <h3>Course Application</h3>
        <div class="field">
          <label>Course Applied For:</label>
          <span><jsp:getProperty name="student" property="course" /></span>
        </div>
      </div>

      <!-- Qualification Section -->
      <div class="result-section">
        <h3>Qualification Details</h3>
        <table class="qualification-table">
          <thead>
            <tr>
              <th>Sl.No.</th>
              <th>Examination</th>
              <th>Board</th>
              <th>Percentage</th>
              <th>Year of Passing</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Class X</td>
              <td>
                <%= request.getParameter("classXBoard") != null ?
                request.getParameter("classXBoard") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("classXPercentage") != null ?
                request.getParameter("classXPercentage") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("classXYear") != null ?
                request.getParameter("classXYear") : "Not provided" %>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>Class XII</td>
              <td>
                <%= request.getParameter("classXIIBoard") != null ?
                request.getParameter("classXIIBoard") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("classXIIPercentage") != null ?
                request.getParameter("classXIIPercentage") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("classXIIYear") != null ?
                request.getParameter("classXIIYear") : "Not provided" %>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>Graduation</td>
              <td>
                <%= request.getParameter("graduationBoard") != null ?
                request.getParameter("graduationBoard") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("graduationPercentage") != null ?
                request.getParameter("graduationPercentage") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("graduationYear") != null ?
                request.getParameter("graduationYear") : "Not provided" %>
              </td>
            </tr>
            <tr>
              <td>4</td>
              <td>Masters</td>
              <td>
                <%= request.getParameter("mastersBoard") != null ?
                request.getParameter("mastersBoard") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("mastersPercentage") != null ?
                request.getParameter("mastersPercentage") : "Not provided" %>
              </td>
              <td>
                <%= request.getParameter("mastersYear") != null ?
                request.getParameter("mastersYear") : "Not provided" %>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="back-button">
        <a href="index.jsp">Back to Registration Form</a>
      </div>
    </div>
  </body>
</html>
