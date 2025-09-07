package iuh.fit.se.tuan03;

import iuh.fit.se.tuan03.entities.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/registration-form")
public class RegistrationForm extends HttpServlet {
    
    public RegistrationForm() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get data from Form
        String fname = request.getParameter("txtFName");
        String lname = request.getParameter("txtLName");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String email = request.getParameter("txtEmail");
        String mobileNumber = request.getParameter("txtMobileNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("txtAddress");
        String city = request.getParameter("txtCity");
        String pinCode = request.getParameter("txtPinCode");
        String state = request.getParameter("txtState");
        String country = request.getParameter("txtCountry");
        String[] hobbiesArray = request.getParameterValues("chkHobbies");
        String otherHobby = request.getParameter("otherHobby");
        String course = request.getParameter("txtCourse");
        
        // Process hobbies
        List<String> hobbies = new ArrayList<>();
        if (hobbiesArray != null) {
            for (String hobby : hobbiesArray) {
                if ("Others".equals(hobby) && otherHobby != null && !otherHobby.trim().isEmpty()) {
                    hobbies.add(otherHobby.trim());
                } else if (!"Others".equals(hobby)) {
                    hobbies.add(hobby);
                }
            }
        }
        
        // Create birthdate string
        String birthdate = day + "/" + month + "/" + year;
        
        // Set data to Student
        Student sv = new Student();
        sv.setFirstName(fname);
        sv.setLastName(lname);
        sv.setDay(day);
        sv.setMonth(month);
        sv.setYear(year);
        sv.setEmail(email);
        sv.setMobileNumber(mobileNumber);
        sv.setGender(gender);
        sv.setAddress(address);
        sv.setCity(city);
        sv.setPinCode(pinCode);
        sv.setState(state);
        sv.setCountry(country);
        sv.setHobbies(hobbies);
        sv.setCourse(course);
        
        // Set object student to request object
        request.setAttribute("student", sv);
        
        // Forward to result-form.jsp
        RequestDispatcher rd = request.getRequestDispatcher("result-form.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
