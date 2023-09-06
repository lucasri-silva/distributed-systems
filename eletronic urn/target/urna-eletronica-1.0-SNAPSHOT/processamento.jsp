<%-- 
    Document   : processamento
    Created on : Aug 30, 2023, 9:48:54 PM
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
    </head>
    <%@page import="java.io.FileWriter"%>
    <body>
        <iframe src="resultado.jsp" width="100%" height="300"></iframe>
            <%
               session.setAttribute("voto", request.getParameter("voto"));
            %>
            <%
    //                 out.print("Voto: " + request.getParameter("voto") + "<br>");
            %>
            <% 
                if (request.getParameter("voto") != null) {
                    try {
                        String voto = request.getParameter("voto");
                        String votoFile;
                        if (voto.equals("blue")) { votoFile = "azul.txt"; }
                        else if (voto.equals("green")) { votoFile = "verde.txt"; }
                        else if (voto.equals("purple")) { votoFile = "roxo.txt"; }
                        else { votoFile = "vermelho.txt"; }
                        String filePath = getServletContext().getRealPath("/") + "repositorio/" + votoFile;
                        java.io.File file = new java.io.File(filePath);
                        java.io.FileWriter writer = new java.io.FileWriter(file, true);
                        writer.write("1");
                        writer.close();
    //                        out.println("Voto written successfully: " + voto); // Debugging output
                    } catch (Exception e) {
                        out.println("Error writing voto: " + e.getMessage()); // Debugging output
                        e.printStackTrace();
                    }
                }
            %>
            <%
            List<Candidate> candidates = new ArrayList<>();
            int totalVotes = 0;

            try {
                String repositorioPath = getServletContext().getRealPath("/") + "repositorio";
                java.io.File repositorioDir = new java.io.File(repositorioPath);
                java.io.File[] files = repositorioDir.listFiles();

                if (files != null) {
                    for (java.io.File file : files) {
                        if (file.isFile()) {
                            java.io.FileReader fileReader = new java.io.FileReader(file);
                            int character;
                            int votesCount = 0;

                            while ((character = fileReader.read()) != -1) {
                                votesCount++;
                            }

                            fileReader.close();

                            String fileName = file.getName();
                            String candidateName = fileName.substring(0, fileName.lastIndexOf('.'));
                            Candidate candidate = new Candidate();
                            candidate.setName(candidateName);
                            candidate.setVotesCount(votesCount);
                            candidates.add(candidate);
                            totalVotes = totalVotes + votesCount;
                        }
                    }
                }
            } catch (Exception e) {
                out.println("Error reading files: " + e.getMessage());
                e.printStackTrace();
            }
            
            request.setAttribute("candidates", candidates);
            request.setAttribute("totalVotes", totalVotes);
            %>
            <% // out.println("Number of candidates: " + (candidates != null ? candidates.size() : 0)); %>
            <jsp:forward page="resultado.jsp"/>
    </body>
</html>
