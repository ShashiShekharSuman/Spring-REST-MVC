<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
    <style>
        /* Additional styles for this page */
        body {
            background-color: #f0f0f0;
            justify-content: center;
        }

        h1 {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        /*table {*/
        /*    width: 100%;*/
        /*    border-collapse: collapse;*/
        /*    margin-bottom: 20px;*/
        /*}*/

        table {
            /*border: 1px solid black;*/
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            width: 95%;
            max-width: 1000px;
            text-align: center;
            /*font-size: 20px;*/
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        td.actions {
            display: inline-flex;
            /*justify-content: space-between;*/
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a.button {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .add {

            background-color: #f0f0f0;
        }

        a.button:hover {
            background-color: #0056b3;
        }

        a.add-button {
            background-color: #28a745;
        }

        a.add-button:hover {
            background-color: #1f822d;
        }
        .edit, .delete {
            /*margin-left: 5px;*/
            margin-right: 5px;
        }
    </style>
</head>
<body>
<h1>Employee List</h1>
<%--<div class="add">--%>

</div>
<table>
    <tr>
    <th class="add"><a href="/employees/form" class="button add-button">Add Employee</a></th>
    </tr>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Action</th>
    </tr>
    <c:forEach var="employee" items="${employees}">
        <tr>
            <td>${employee.getEmployeeId()}</td>
            <td>${employee.getEmployeeName()}</td>
            <td>${employee.getEmployeeAge()}</td>
            <td>${employee.getEmployeeDepartment()}</td>
            <td>${employee.getEmployeeSalary()}</td>
            <td class="actions">
                <form action="/employees/form", method="post">
                    <input type="hidden" name="id" value="${employee.getEmployeeId()}"> <!-- Hidden field for ID when deleting -->
                    <input class="edit" type="submit" value="Edit">
                </form>
                <form action="/deleteEmployee">
                    <input type="hidden" name="id" value="${employee.getEmployeeId()}"> <!-- Hidden field for ID when deleting -->
                    <input class="delete" type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>