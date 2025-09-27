<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="iuh.fit.se.connect_jpa.entity.User" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: white;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
        }
        select {
            cursor: pointer;
        }
        select option {
            padding: 8px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
        .error {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }
        .success {
            color: #28a745;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            User user = (User) request.getAttribute("user");
            boolean isEdit = user != null && user.getId() != null;
            String action = isEdit ? "user-update" : "user-save";
            String title = isEdit ? "✏️ Sửa User" : "➕ Thêm User mới";
        %>
        
        <h1><%= title %></h1>
        
        <form action="<%= action %>" method="post">
            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= user.getId() %>">
            <% } %>
            
            <div class="form-group">
                <label for="name">Tên:</label>
                <input type="text" id="name" name="name" 
                       value="<%= user != null ? user.getName() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" 
                       value="<%= user != null ? user.getEmail() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" 
                       value="<%= user != null ? user.getPassword() : "" %>" 
                       required>
            </div>
            
            <div class="form-group">
                <label for="country">Quốc gia:</label>
                <select id="country" name="country" required>
                    <option value="">-- Chọn quốc gia --</option>
                    <option value="Việt Nam" <%= (user != null && "Việt Nam".equals(user.getCountry())) ? "selected" : "" %>>🇻🇳 Việt Nam</option>
                    <option value="Thái Lan" <%= (user != null && "Thái Lan".equals(user.getCountry())) ? "selected" : "" %>>🇹🇭 Thái Lan</option>
                    <option value="Singapore" <%= (user != null && "Singapore".equals(user.getCountry())) ? "selected" : "" %>>🇸🇬 Singapore</option>
                    <option value="Malaysia" <%= (user != null && "Malaysia".equals(user.getCountry())) ? "selected" : "" %>>🇲🇾 Malaysia</option>
                    <option value="Indonesia" <%= (user != null && "Indonesia".equals(user.getCountry())) ? "selected" : "" %>>🇮🇩 Indonesia</option>
                    <option value="Philippines" <%= (user != null && "Philippines".equals(user.getCountry())) ? "selected" : "" %>>🇵🇭 Philippines</option>
                    <option value="Myanmar" <%= (user != null && "Myanmar".equals(user.getCountry())) ? "selected" : "" %>>🇲🇲 Myanmar</option>
                    <option value="Cambodia" <%= (user != null && "Cambodia".equals(user.getCountry())) ? "selected" : "" %>>🇰🇭 Cambodia</option>
                    <option value="Laos" <%= (user != null && "Laos".equals(user.getCountry())) ? "selected" : "" %>>🇱🇦 Laos</option>
                    <option value="Brunei" <%= (user != null && "Brunei".equals(user.getCountry())) ? "selected" : "" %>>🇧🇳 Brunei</option>
                    <option value="Trung Quốc" <%= (user != null && "Trung Quốc".equals(user.getCountry())) ? "selected" : "" %>>🇨🇳 Trung Quốc</option>
                    <option value="Nhật Bản" <%= (user != null && "Nhật Bản".equals(user.getCountry())) ? "selected" : "" %>>🇯🇵 Nhật Bản</option>
                    <option value="Hàn Quốc" <%= (user != null && "Hàn Quốc".equals(user.getCountry())) ? "selected" : "" %>>🇰🇷 Hàn Quốc</option>
                    <option value="Ấn Độ" <%= (user != null && "Ấn Độ".equals(user.getCountry())) ? "selected" : "" %>>🇮🇳 Ấn Độ</option>
                    <option value="Mỹ" <%= (user != null && "Mỹ".equals(user.getCountry())) ? "selected" : "" %>>🇺🇸 Mỹ</option>
                    <option value="Canada" <%= (user != null && "Canada".equals(user.getCountry())) ? "selected" : "" %>>🇨🇦 Canada</option>
                    <option value="Anh" <%= (user != null && "Anh".equals(user.getCountry())) ? "selected" : "" %>>🇬🇧 Anh</option>
                    <option value="Pháp" <%= (user != null && "Pháp".equals(user.getCountry())) ? "selected" : "" %>>🇫🇷 Pháp</option>
                    <option value="Đức" <%= (user != null && "Đức".equals(user.getCountry())) ? "selected" : "" %>>🇩🇪 Đức</option>
                    <option value="Úc" <%= (user != null && "Úc".equals(user.getCountry())) ? "selected" : "" %>>🇦🇺 Úc</option>
                    <option value="New Zealand" <%= (user != null && "New Zealand".equals(user.getCountry())) ? "selected" : "" %>>🇳🇿 New Zealand</option>
                    <option value="Brazil" <%= (user != null && "Brazil".equals(user.getCountry())) ? "selected" : "" %>>🇧🇷 Brazil</option>
                    <option value="Argentina" <%= (user != null && "Argentina".equals(user.getCountry())) ? "selected" : "" %>>🇦🇷 Argentina</option>
                    <option value="Mexico" <%= (user != null && "Mexico".equals(user.getCountry())) ? "selected" : "" %>>🇲🇽 Mexico</option>
                    <option value="Nga" <%= (user != null && "Nga".equals(user.getCountry())) ? "selected" : "" %>>🇷🇺 Nga</option>
                    <option value="Ý" <%= (user != null && "Ý".equals(user.getCountry())) ? "selected" : "" %>>🇮🇹 Ý</option>
                    <option value="Tây Ban Nha" <%= (user != null && "Tây Ban Nha".equals(user.getCountry())) ? "selected" : "" %>>🇪🇸 Tây Ban Nha</option>
                    <option value="Hà Lan" <%= (user != null && "Hà Lan".equals(user.getCountry())) ? "selected" : "" %>>🇳🇱 Hà Lan</option>
                    <option value="Thụy Sĩ" <%= (user != null && "Thụy Sĩ".equals(user.getCountry())) ? "selected" : "" %>>🇨🇭 Thụy Sĩ</option>
                    <option value="Thụy Điển" <%= (user != null && "Thụy Điển".equals(user.getCountry())) ? "selected" : "" %>>🇸🇪 Thụy Điển</option>
                    <option value="Na Uy" <%= (user != null && "Na Uy".equals(user.getCountry())) ? "selected" : "" %>>🇳🇴 Na Uy</option>
                    <option value="Đan Mạch" <%= (user != null && "Đan Mạch".equals(user.getCountry())) ? "selected" : "" %>>🇩🇰 Đan Mạch</option>
                    <option value="Phần Lan" <%= (user != null && "Phần Lan".equals(user.getCountry())) ? "selected" : "" %>>🇫🇮 Phần Lan</option>
                    <option value="Bỉ" <%= (user != null && "Bỉ".equals(user.getCountry())) ? "selected" : "" %>>🇧🇪 Bỉ</option>
                    <option value="Áo" <%= (user != null && "Áo".equals(user.getCountry())) ? "selected" : "" %>>🇦🇹 Áo</option>
                    <option value="Ba Lan" <%= (user != null && "Ba Lan".equals(user.getCountry())) ? "selected" : "" %>>🇵🇱 Ba Lan</option>
                    <option value="Cộng hòa Séc" <%= (user != null && "Cộng hòa Séc".equals(user.getCountry())) ? "selected" : "" %>>🇨🇿 Cộng hòa Séc</option>
                    <option value="Hungary" <%= (user != null && "Hungary".equals(user.getCountry())) ? "selected" : "" %>>🇭🇺 Hungary</option>
                    <option value="Romania" <%= (user != null && "Romania".equals(user.getCountry())) ? "selected" : "" %>>🇷🇴 Romania</option>
                    <option value="Bulgaria" <%= (user != null && "Bulgaria".equals(user.getCountry())) ? "selected" : "" %>>🇧🇬 Bulgaria</option>
                    <option value="Croatia" <%= (user != null && "Croatia".equals(user.getCountry())) ? "selected" : "" %>>🇭🇷 Croatia</option>
                    <option value="Slovenia" <%= (user != null && "Slovenia".equals(user.getCountry())) ? "selected" : "" %>>🇸🇮 Slovenia</option>
                    <option value="Slovakia" <%= (user != null && "Slovakia".equals(user.getCountry())) ? "selected" : "" %>>🇸🇰 Slovakia</option>
                    <option value="Estonia" <%= (user != null && "Estonia".equals(user.getCountry())) ? "selected" : "" %>>🇪🇪 Estonia</option>
                    <option value="Latvia" <%= (user != null && "Latvia".equals(user.getCountry())) ? "selected" : "" %>>🇱🇻 Latvia</option>
                    <option value="Lithuania" <%= (user != null && "Lithuania".equals(user.getCountry())) ? "selected" : "" %>>🇱🇹 Lithuania</option>
                    <option value="Ireland" <%= (user != null && "Ireland".equals(user.getCountry())) ? "selected" : "" %>>🇮🇪 Ireland</option>
                    <option value="Portugal" <%= (user != null && "Portugal".equals(user.getCountry())) ? "selected" : "" %>>🇵🇹 Portugal</option>
                    <option value="Greece" <%= (user != null && "Greece".equals(user.getCountry())) ? "selected" : "" %>>🇬🇷 Greece</option>
                    <option value="Turkey" <%= (user != null && "Turkey".equals(user.getCountry())) ? "selected" : "" %>>🇹🇷 Turkey</option>
                    <option value="Israel" <%= (user != null && "Israel".equals(user.getCountry())) ? "selected" : "" %>>🇮🇱 Israel</option>
                    <option value="UAE" <%= (user != null && "UAE".equals(user.getCountry())) ? "selected" : "" %>>🇦🇪 UAE</option>
                    <option value="Saudi Arabia" <%= (user != null && "Saudi Arabia".equals(user.getCountry())) ? "selected" : "" %>>🇸🇦 Saudi Arabia</option>
                    <option value="Egypt" <%= (user != null && "Egypt".equals(user.getCountry())) ? "selected" : "" %>>🇪🇬 Egypt</option>
                    <option value="South Africa" <%= (user != null && "South Africa".equals(user.getCountry())) ? "selected" : "" %>>🇿🇦 South Africa</option>
                    <option value="Nigeria" <%= (user != null && "Nigeria".equals(user.getCountry())) ? "selected" : "" %>>🇳🇬 Nigeria</option>
                    <option value="Kenya" <%= (user != null && "Kenya".equals(user.getCountry())) ? "selected" : "" %>>🇰🇪 Kenya</option>
                    <option value="Morocco" <%= (user != null && "Morocco".equals(user.getCountry())) ? "selected" : "" %>>🇲🇦 Morocco</option>
                    <option value="Tunisia" <%= (user != null && "Tunisia".equals(user.getCountry())) ? "selected" : "" %>>🇹🇳 Tunisia</option>
                    <option value="Algeria" <%= (user != null && "Algeria".equals(user.getCountry())) ? "selected" : "" %>>🇩🇿 Algeria</option>
                    <option value="Libya" <%= (user != null && "Libya".equals(user.getCountry())) ? "selected" : "" %>>🇱🇾 Libya</option>
                    <option value="Sudan" <%= (user != null && "Sudan".equals(user.getCountry())) ? "selected" : "" %>>🇸🇩 Sudan</option>
                    <option value="Ethiopia" <%= (user != null && "Ethiopia".equals(user.getCountry())) ? "selected" : "" %>>🇪🇹 Ethiopia</option>
                    <option value="Ghana" <%= (user != null && "Ghana".equals(user.getCountry())) ? "selected" : "" %>>🇬🇭 Ghana</option>
                    <option value="Senegal" <%= (user != null && "Senegal".equals(user.getCountry())) ? "selected" : "" %>>🇸🇳 Senegal</option>
                    <option value="Ivory Coast" <%= (user != null && "Ivory Coast".equals(user.getCountry())) ? "selected" : "" %>>🇨🇮 Ivory Coast</option>
                    <option value="Mali" <%= (user != null && "Mali".equals(user.getCountry())) ? "selected" : "" %>>🇲🇱 Mali</option>
                    <option value="Burkina Faso" <%= (user != null && "Burkina Faso".equals(user.getCountry())) ? "selected" : "" %>>🇧🇫 Burkina Faso</option>
                    <option value="Niger" <%= (user != null && "Niger".equals(user.getCountry())) ? "selected" : "" %>>🇳🇪 Niger</option>
                    <option value="Chad" <%= (user != null && "Chad".equals(user.getCountry())) ? "selected" : "" %>>🇹🇩 Chad</option>
                    <option value="Cameroon" <%= (user != null && "Cameroon".equals(user.getCountry())) ? "selected" : "" %>>🇨🇲 Cameroon</option>
                    <option value="Central African Republic" <%= (user != null && "Central African Republic".equals(user.getCountry())) ? "selected" : "" %>>🇨🇫 Central African Republic</option>
                    <option value="Democratic Republic of Congo" <%= (user != null && "Democratic Republic of Congo".equals(user.getCountry())) ? "selected" : "" %>>🇨🇩 Democratic Republic of Congo</option>
                    <option value="Republic of Congo" <%= (user != null && "Republic of Congo".equals(user.getCountry())) ? "selected" : "" %>>🇨🇬 Republic of Congo</option>
                    <option value="Gabon" <%= (user != null && "Gabon".equals(user.getCountry())) ? "selected" : "" %>>🇬🇦 Gabon</option>
                    <option value="Equatorial Guinea" <%= (user != null && "Equatorial Guinea".equals(user.getCountry())) ? "selected" : "" %>>🇬🇶 Equatorial Guinea</option>
                    <option value="São Tomé and Príncipe" <%= (user != null && "São Tomé and Príncipe".equals(user.getCountry())) ? "selected" : "" %>>🇸🇹 São Tomé and Príncipe</option>
                    <option value="Angola" <%= (user != null && "Angola".equals(user.getCountry())) ? "selected" : "" %>>🇦🇴 Angola</option>
                    <option value="Zambia" <%= (user != null && "Zambia".equals(user.getCountry())) ? "selected" : "" %>>🇿🇲 Zambia</option>
                    <option value="Zimbabwe" <%= (user != null && "Zimbabwe".equals(user.getCountry())) ? "selected" : "" %>>🇿🇼 Zimbabwe</option>
                    <option value="Botswana" <%= (user != null && "Botswana".equals(user.getCountry())) ? "selected" : "" %>>🇧🇼 Botswana</option>
                    <option value="Namibia" <%= (user != null && "Namibia".equals(user.getCountry())) ? "selected" : "" %>>🇳🇦 Namibia</option>
                    <option value="Lesotho" <%= (user != null && "Lesotho".equals(user.getCountry())) ? "selected" : "" %>>🇱🇸 Lesotho</option>
                    <option value="Swaziland" <%= (user != null && "Swaziland".equals(user.getCountry())) ? "selected" : "" %>>🇸🇿 Swaziland</option>
                    <option value="Madagascar" <%= (user != null && "Madagascar".equals(user.getCountry())) ? "selected" : "" %>>🇲🇬 Madagascar</option>
                    <option value="Mauritius" <%= (user != null && "Mauritius".equals(user.getCountry())) ? "selected" : "" %>>🇲🇺 Mauritius</option>
                    <option value="Seychelles" <%= (user != null && "Seychelles".equals(user.getCountry())) ? "selected" : "" %>>🇸🇨 Seychelles</option>
                    <option value="Comoros" <%= (user != null && "Comoros".equals(user.getCountry())) ? "selected" : "" %>>🇰🇲 Comoros</option>
                    <option value="Djibouti" <%= (user != null && "Djibouti".equals(user.getCountry())) ? "selected" : "" %>>🇩🇯 Djibouti</option>
                    <option value="Somalia" <%= (user != null && "Somalia".equals(user.getCountry())) ? "selected" : "" %>>🇸🇴 Somalia</option>
                    <option value="Eritrea" <%= (user != null && "Eritrea".equals(user.getCountry())) ? "selected" : "" %>>🇪🇷 Eritrea</option>
                    <option value="Rwanda" <%= (user != null && "Rwanda".equals(user.getCountry())) ? "selected" : "" %>>🇷🇼 Rwanda</option>
                    <option value="Burundi" <%= (user != null && "Burundi".equals(user.getCountry())) ? "selected" : "" %>>🇧🇮 Burundi</option>
                    <option value="Tanzania" <%= (user != null && "Tanzania".equals(user.getCountry())) ? "selected" : "" %>>🇹🇿 Tanzania</option>
                    <option value="Uganda" <%= (user != null && "Uganda".equals(user.getCountry())) ? "selected" : "" %>>🇺🇬 Uganda</option>
                    <option value="Malawi" <%= (user != null && "Malawi".equals(user.getCountry())) ? "selected" : "" %>>🇲🇼 Malawi</option>
                    <option value="Mozambique" <%= (user != null && "Mozambique".equals(user.getCountry())) ? "selected" : "" %>>🇲🇿 Mozambique</option>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-success">
                    <%= isEdit ? "💾 Cập nhật" : "➕ Thêm mới" %>
                </button>
                <a href="index.jsp" class="btn btn-secondary">🏠 Trang chủ</a>
            </div>
        </form>
    </div>
</body>
</html>