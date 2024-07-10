<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.fundtransfer.model.Beneficiary"%>

<!DOCTYPE html>
<html lang="eng">
<head>
<meta charset="ISO-8859-1">
<title>Beneficiary Management</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    integrity="sha512-Fo3rlrZj/k7ujTnH2N2QZnBjl0XKq8jn59xN2ePv+I1fdk0/5R1d6Q4B5sH8p+E4GZpv6/OiPq4sMz7MWZsPdA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/* Existing styles */

body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
}

.sidebar {
    width: 180px;
    min-height: 100vh;
    background-color: #2c3e50;
    color: #fff;
    padding: 20px;
}

.sidebar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.sidebar h2 {
    margin: 0;
    font-size: 20px;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
}

.sidebar ul li {
    padding: 15px 0;
}

.sidebar ul li a {
    color: #fff;
    text-decoration: none;
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 4px;
    transition: background 0.3s;
}

.sidebar ul li a i {
    margin-right: 10px;
}

.sidebar ul li a:hover {
    background-color: #34495e;
}

.table-container {
    flex-grow: 1;
    padding: 20px;
    position: relative; /* Ensure relative positioning */
}

table {
    border-collapse: collapse;
    width: 100%;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

th {
    background-color: #2c3e50;
    color: white;
}

/* Popup form styling */
.modal {
    display: none; /* Initially hidden */
    visibility: hidden; /* Ensure hidden state */
    position: fixed; /* Position fixed for overlay */
    z-index: 1; /* Sit on top */
    background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fefefe;
    padding: 20px;
    border: 1px solid #888;
    width: 60%; /* Adjust width as needed */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    max-height: 80%; /* Limit height to prevent overflow */
    overflow-y: auto; /* Enable vertical scrolling if needed */
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
}

/* Style for form fields */
.modal-content label {
    margin-bottom: 5px;
    display: block;
}

.modal-content input[type="text"] {
    width: calc(100% - 12px);
    padding: 6px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.modal-content button {
    padding: 10px 20px;
    background-color: #2c3e50; /* Sidebar color */
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.modal-content button:hover {
    background-color: #34495e; /* Darker shade for hover */
}
</style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>
                <i class="fas fa-piggy-bank"></i> fastpay
            </h2>
        </div>
        <ul>
            <li><a href="userprofile.jsp"><i class="fas fa-key"></i>
                    UserProfile</a></li>
            <!-- Remove onclick from here -->
            <li><a href="#"><i class="fas fa-history"></i> Transaction
                    History</a></li>
        </ul>
    </div>
    
    <!-- Main Content -->
    <div class="table-container">
        <button type="button" onclick="openAddPopup()">Add User</button> <!-- Add User Button -->
        <table>
            <thead>
                <tr>
                    <th>Beneficiary Name</th>
                    <th>Beneficiary Account ID</th>
                    <th>Beneficiary IFSC</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% List<Beneficiary> beneficiaryList = (List<Beneficiary>) request.getAttribute("beneficiarydetails"); %>
                <% for (Beneficiary view : beneficiaryList) { %>
                <tr>
                    <td><%= view.getBeneficiaryName() %></td>
                    <td><%= view.getBeneficiaryAccountId()%></td>
                    <td><%= view.getIfsccode()%></td>
                    <td>
                        <!-- Edit Button -->
                        <button type="button" class="edit-button"
                            onclick="openPopup('<%= view.getBeneficiaryId() %>', '<%= view.getBeneficiaryName() %>', '<%= view.getBeneficiaryAccountId() %>', '<%= view.getIfsccode() %>')">
                            Edit</button>
                    </td>
                    <td>
                        <!-- Delete Form -->
                        <form action="deletebeneficiary" method="post">
                            <input type="hidden" name="viewid" value="<%=session.getAttribute("id") %>">
                            <input type="hidden" name="action" value="deletebeneficiary">
                            <input type="hidden" name="deleteid"
                                value="<%= view.getBeneficiaryId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Edit Beneficiary Modal -->
    <div id="editBeneficiaryForm" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closePopup()">&times;</span>
            <h2>Edit Beneficiary</h2>
            <form id="editForm" action="updatebeneficiarydetails" method="post">
                <input type="hidden" id="editBeneficiaryId" name="editBeneficiaryId">
                <label for="editBeneficiaryName">Beneficiary Name:</label> 
                <input type="text" id="editBeneficiaryName" name="editBeneficiaryName" required>
                <label for="editBeneficiaryAccountId">Beneficiary Account ID:</label> 
                <input type="text" id="editBeneficiaryAccountId" name="editBeneficiaryAccountId" required> 
                <label for="editBeneficiaryIfscCode">Beneficiary IFSC Code:</label> 
                <input type="text" id="editBeneficiaryIfscCode" name="editBeneficiaryIfscCode" required> 
                <input type="hidden" name="id" value="<%=session.getAttribute("id") %>"> 
                <input type="hidden" name="action" value="editbeneficiary">
                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>

    <!-- Add Beneficiary Modal -->
    <div id="addBeneficiaryForm" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAddPopup()">&times;</span>
            <h2>Add Beneficiary</h2>
            <form id="addForm" action="addbeneficiary" method="post">
                <label for="addBeneficiaryName">Beneficiary Name:</label> 
                <input type="text" id="addBeneficiaryName" name="addBeneficiaryName" required>
                <label for="addBeneficiaryAccountId">Beneficiary Account ID:</label> 
                <input type="text" id="addBeneficiaryAccountId" name="addBeneficiaryAccountId" required> 
                <label for="addBeneficiaryIfscCode">Beneficiary IFSC Code:</label> 
                <input type="text" id="addBeneficiaryIfscCode" name="addBeneficiaryIfscCode" required> 
                <input type="hidden" name="id" value="<%=session.getAttribute("id") %>"> 
                <input type="hidden" name="action" value="addbeneficiary">
                <button type="submit">Add Beneficiary</button>
            </form>
        </div>
    </div>

    <script>
    function openPopup(beneficiaryId, beneficiaryName, beneficiaryAccountId, beneficiaryIfscCode) {
        document.getElementById('editBeneficiaryId').value = beneficiaryId;
        document.getElementById('editBeneficiaryName').value = beneficiaryName;
        document.getElementById('editBeneficiaryAccountId').value = beneficiaryAccountId;
        document.getElementById('editBeneficiaryIfscCode').value = beneficiaryIfscCode;
        var modal = document.getElementById('editBeneficiaryForm');
        modal.style.display = 'flex'; 
        modal.style.visibility = 'visible'; 
    }

    function closePopup() {
        var modal = document.getElementById('editBeneficiaryForm');
        modal.style.display = 'none';
        modal.style.visibility = 'hidden';
    }

    function openAddPopup() {
        var modal = document.getElementById('addBeneficiaryForm');
        modal.style.display = 'flex'; 
        modal.style.visibility = 'visible'; 
    }

    function closeAddPopup() {
        var modal = document.getElementById('addBeneficiaryForm');
        modal.style.display = 'none';
        modal.style.visibility = 'hidden';
    }
    </script>

</body>
</html>
