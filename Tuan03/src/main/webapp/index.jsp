<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Registration Form</title>
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
      .form-group {
        margin-bottom: 15px;
      }
      label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
      }
      input[type='text'],
      input[type='email'],
      textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
      }
      select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: white;
        color: #333;
        font-size: 14px;
      }
      textarea {
        height: 80px;
        resize: vertical;
      }
      .date-group {
        display: flex;
        gap: 10px;
      }
      .date-group select {
        flex: 1;
      }
      .radio-group,
      .checkbox-group {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
      }
      .radio-group label,
      .checkbox-group label {
        display: inline;
        font-weight: normal;
        margin-right: 5px;
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
      .qualification-table input {
        width: 100%;
        border: none;
        padding: 5px;
      }
      .button-group {
        text-align: center;
        margin-top: 30px;
      }
      button {
        background-color: #4caf50;
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin: 0 10px;
      }
      button[type='reset'] {
        background-color: #f44336;
      }
      button:hover {
        opacity: 0.8;
      }
      .hint {
        font-size: 12px;
        color: #666;
        font-style: italic;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Student Registration Form</h1>

      <form action="registration-form" name="formDangKy" method="GET">
        <!-- Personal Information Section -->
        <h3>Personal Information</h3>

        <div class="form-group">
          <label for="txtFName">First Name:</label>
          <input type="text" id="txtFName" name="txtFName" required />
          <span class="hint">(max 30 characters a-z and A-Z)</span>
        </div>

        <div class="form-group">
          <label for="txtLName">Last Name:</label>
          <input type="text" id="txtLName" name="txtLName" required />
          <span class="hint">(max 30 characters a-z and A-Z)</span>
        </div>

        <div class="form-group">
          <label>Date of Birth:</label>
          <div class="date-group">
            <select name="day" required>
              <option value="">Day</option>
              <option value="01">1</option>
              <option value="02">2</option>
              <option value="03">3</option>
              <option value="04">4</option>
              <option value="05">5</option>
              <option value="06">6</option>
              <option value="07">7</option>
              <option value="08">8</option>
              <option value="09">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>
            </select>
            <select name="month" required>
              <option value="">Month</option>
              <option value="01">January</option>
              <option value="02">February</option>
              <option value="03">March</option>
              <option value="04">April</option>
              <option value="05">May</option>
              <option value="06">June</option>
              <option value="07">July</option>
              <option value="08">August</option>
              <option value="09">September</option>
              <option value="10">October</option>
              <option value="11">November</option>
              <option value="12">December</option>
            </select>
            <select name="year" required>
              <option value="">Year</option>
              <option value="1990">1990</option>
              <option value="1991">1991</option>
              <option value="1992">1992</option>
              <option value="1993">1993</option>
              <option value="1994">1994</option>
              <option value="1995">1995</option>
              <option value="1996">1996</option>
              <option value="1997">1997</option>
              <option value="1998">1998</option>
              <option value="1999">1999</option>
              <option value="2000">2000</option>
              <option value="2001">2001</option>
              <option value="2002">2002</option>
              <option value="2003">2003</option>
              <option value="2004">2004</option>
              <option value="2005">2005</option>
              <option value="2006">2006</option>
              <option value="2007">2007</option>
              <option value="2008">2008</option>
              <option value="2009">2009</option>
              <option value="2010">2010</option>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label for="txtEmail">Email:</label>
          <input type="email" id="txtEmail" name="txtEmail" required />
        </div>

        <div class="form-group">
          <label for="txtMobileNumber">Mobile Number:</label>
          <input
            type="text"
            id="txtMobileNumber"
            name="txtMobileNumber"
            required
          />
          <span class="hint">(10 digit number)</span>
        </div>

        <div class="form-group">
          <label>Gender:</label>
          <div class="radio-group">
            <label
              ><input type="radio" name="gender" value="Male" /> Male</label
            >
            <label
              ><input type="radio" name="gender" value="Female" /> Female</label
            >
          </div>
        </div>

        <!-- Contact Information Section -->
        <h3>Contact Information</h3>

        <div class="form-group">
          <label for="txtAddress">Address:</label>
          <textarea id="txtAddress" name="txtAddress" required></textarea>
        </div>

        <div class="form-group">
          <label for="txtCity">City:</label>
          <input type="text" id="txtCity" name="txtCity" required />
          <span class="hint">(max 30 characters a-z and A-Z)</span>
        </div>

        <div class="form-group">
          <label for="txtPinCode">Pin Code:</label>
          <input type="text" id="txtPinCode" name="txtPinCode" required />
          <span class="hint">(6 digit number)</span>
        </div>

        <div class="form-group">
          <label for="txtState">State:</label>
          <input type="text" id="txtState" name="txtState" required />
          <span class="hint">(max 30 characters a-z and A-Z)</span>
        </div>

        <div class="form-group">
          <label for="txtCountry">Country:</label>
          <input
            type="text"
            id="txtCountry"
            name="txtCountry"
            value="Vietnam"
            required
          />
        </div>

        <!-- Hobbies Section -->
        <h3>Hobbies</h3>
        <div class="form-group">
          <label>Hobbies:</label>
          <div class="checkbox-group">
            <label
              ><input type="checkbox" name="chkHobbies" value="Drawing" />
              Drawing</label
            >
            <label
              ><input type="checkbox" name="chkHobbies" value="Singing" />
              Singing</label
            >
            <label
              ><input type="checkbox" name="chkHobbies" value="Dancing" />
              Dancing</label
            >
            <label
              ><input type="checkbox" name="chkHobbies" value="Sketching" />
              Sketching</label
            >
            <label
              ><input type="checkbox" name="chkHobbies" value="Others" />
              Others</label
            >
            <input
              type="text"
              name="otherHobby"
              placeholder="Specify other hobby"
            />
          </div>
        </div>

        <!-- Qualification Section -->
        <h3>Qualification</h3>
        <div class="form-group">
          <label>Qualification:</label>
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
                  <input
                    type="text"
                    name="classXBoard"
                    placeholder="Board name"
                  />
                </td>
                <td>
                  <input
                    type="text"
                    name="classXPercentage"
                    placeholder="Percentage"
                  />
                </td>
                <td>
                  <input type="text" name="classXYear" placeholder="Year" />
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td>Class XII</td>
                <td>
                  <input
                    type="text"
                    name="classXIIBoard"
                    placeholder="Board name"
                  />
                </td>
                <td>
                  <input
                    type="text"
                    name="classXIIPercentage"
                    placeholder="Percentage"
                  />
                </td>
                <td>
                  <input type="text" name="classXIIYear" placeholder="Year" />
                </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Graduation</td>
                <td>
                  <input
                    type="text"
                    name="graduationBoard"
                    placeholder="Board name"
                  />
                </td>
                <td>
                  <input
                    type="text"
                    name="graduationPercentage"
                    placeholder="Percentage"
                  />
                </td>
                <td>
                  <input type="text" name="graduationYear" placeholder="Year" />
                </td>
              </tr>
              <tr>
                <td>4</td>
                <td>Masters</td>
                <td>
                  <input
                    type="text"
                    name="mastersBoard"
                    placeholder="Board name"
                  />
                </td>
                <td>
                  <input
                    type="text"
                    name="mastersPercentage"
                    placeholder="Percentage"
                  />
                </td>
                <td>
                  <input type="text" name="mastersYear" placeholder="Year" />
                </td>
              </tr>
            </tbody>
          </table>
          <span class="hint"
            >(10 char max) for Board, (upto 2 decimal) for Percentage</span
          >
        </div>

        <!-- Course Application Section -->
        <h3>Course Application</h3>
        <div class="form-group">
          <label>Course applies for:</label>
          <div class="radio-group">
            <label
              ><input type="radio" name="txtCourse" value="BCA" /> BCA</label
            >
            <label
              ><input type="radio" name="txtCourse" value="B.Com" />
              B.Com</label
            >
            <label
              ><input type="radio" name="txtCourse" value="B.Sc" /> B.Sc</label
            >
            <label
              ><input type="radio" name="txtCourse" value="B.A" /> B.A</label
            >
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="button-group">
          <button type="submit">Submit</button>
          <button type="reset">Reset</button>
        </div>
      </form>
    </div>
  </body>
</html>
