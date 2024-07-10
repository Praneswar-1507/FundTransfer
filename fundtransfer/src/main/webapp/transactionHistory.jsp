<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.fundtransfer.model.Payment"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Transaction History</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    integrity="sha512-Fo3rlrZj/k7ujTnH2N2QZnBjl0XKq8jn59xN2ePv+I1fdk0/5R1d6Q4B5sH8p+E4GZpv6/OiPq4sMz7MWZsPdA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cosmo/bootstrap.min.css" rel="stylesheet">

<style>
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
}

.search-container {
    margin-bottom: 20px;
}

.search-container form {
    display: flex;
    gap: 10px;
    align-items: center;
}

.search-container input[type="date"] {
    width: 180px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
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

.btn-primary {
    background-color: #2c3e50 !important;
    color: white !important;
    border-color: #2c3e50 !important;
}

.btn-primary:hover {
    background-color: #34495e !important; /* darker shade for hover effect */
    color: white !important;
    border-color: #34495e !important;
}
</style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h2>
                <i class="fas fa-piggy-bank"></i> fastpay
            </h2>
        </div>
        <ul>
            <li><a href="userProfile.jsp"><i class="fas fa-key"></i>UserProfile</a></li>
            <li><a href="#" role="button" onclick="openPopup()"
                aria-label="Deposit"> <i class="fas fa-user"></i> Deposit
            </a></li>
            <li><a href="#"><i class="fas fa-history"></i> Transaction
                    History</a></li>
        </ul>
    </div>

    <div class="table-container">
        <div class="search-container">
            <form>
                <input type="date" id="startDate" name="startDate" placeholder="Start Date">
                <input type="date" id="endDate" name="endDate" placeholder="End Date">
            </form>
        </div>
        <table id="transactionTable">
            <thead>
                <tr>
                    <th>TransferId</th>
                    <th>SenderAccNo</th>
                    <th>ReceiverAccNo</th>
                    <th>TransferDate</th>
                    <th>TransferAmount</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Payment> history = (List<Payment>) request.getAttribute("payment");
                for (Payment transferHistory : history) {
                %>
                <tr>
                    <td><%=transferHistory.getTransferId()%></td>
                    <td><%=transferHistory.getSendAccountNo()%></td>
                    <td><%=transferHistory.getRecepientAccountNo()%></td>
                    <td><%=transferHistory.getDate()%></td>
                    <td><%=transferHistory.getAmount()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var table = $('#transactionTable').DataTable({
            responsive: true,
            dom: 'Blfrtip',
            buttons: [
                { extend: 'copy', className: 'btn btn-primary my-3' },
                { extend: 'csv', className: 'btn btn-primary' },
                { extend: 'excel', className: 'btn btn-primary' },
                { extend: 'pdf', className: 'btn btn-primary' },
                { extend: 'print', className: 'btn btn-primary' }
            ],
            lengthMenu: [10, 25, 50, 100],
            language: {
                paginate: {
                    previous: "Previous",
                    next: "Next"
                }
            },
            pagingType: "full_numbers"
        });

        function filterByDate(settings, data, dataIndex) {
            var min = $('#startDate').val();
            var max = $('#endDate').val();
            var date = data[3]; 

            if ((min === "" && max === "") || 
                (min === "" && date <= max) ||
                (min <= date && max === "") ||
                (min <= date && date <= max)) {
                return true;
            }
            return false;
        }

        $('#startDate, #endDate').change(function() {
            table.draw();
        });

        $.fn.dataTable.ext.search.push(filterByDate);
    });
</script>
</body>
</html>
