<%-- 
    Document   : resultado
    Created on : Aug 30, 2023, 9:53:50 PM
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.model.Candidate" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
        <style>
            table {
                border-collapse: collapse;
                width: 600px;
                margin: auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            .tbgrafico td {
                border: none;
            }
            .graph-container {
                width: 500px;
                height: 25px;
                border: 1px solid #ccc;
                overflow: hidden;
            }
            .graph-bar {
                height: 100%;
            }
        </style>
    </head>
    <body>
    <center>
        <div>
            <h2>Resultado da Eleição</h2>
            <table>
                <tr>
                    <th>Candidatos</th>
                    <th>Número de votos</th>
                </tr>
                <% List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates"); %>
                <% // out.println("Number of candidates: " + (candidates != null ? candidates.size() : 0)); %>
                <%  for (Candidate candidate : candidates) { %>
                <tr>
                    <td><%= candidate.getName() %></td>
                    <td><%= candidate.getVotesCount() %></td>
                </tr>
                <% } %>
            </table>
        </div>

        <div>
            <h2>Resultado Percentual (%)</h2>
            <table class="tbgrafico">
                <% int total = (int) request.getAttribute("totalVotes"); %>
                <% if (candidates != null) {
                    for (Candidate candidate : candidates) {
                        String name = candidate.getName();
                        int numVotes = candidate.getVotesCount();
                        double percentage = ((double) numVotes / total) * 100;
                %>
                <tr>
                    <td><%= name %><br><%= String.format("%.2f", percentage) %>%</td>
                    <td>
                        <div class='graph-container'>
                            <div class="graph-bar" style="width: <%= percentage %>%;">
                                <img align="left" src="<%= "images/" + name + ".png" %>"
                                     width="100%"
                                     height="25">
                            </div>
                        </div>
                    </td>
                </tr>

                <%
                    }
                }
                %>
            </table>
        </div>
    </center>
</body>
</html>
