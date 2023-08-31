<%-- 
    Document   : index
    Created on : 30 de ago. de 2023, 19:40:10
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Urna Eletrônica</title>
        <style>
            table {
                border-collapse: collapse;
                width: 25%;
                margin: auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .title {
                text-align: center;
            }
            .centered-button {
                text-align: center;
            }

            .button-container {
                width: 100%;
            }

            .full-width-button {
                width: 80%;
                box-sizing: border-box; /* Include padding and border in the width calculation */
            }
        </style>
    </head>
    <body>
    <center>
        <form name="frmvotacao" method="get" action="processamento.jsp">
            <table border="1">
                <tr>
                    <td bgcolor="black" colspan="2" class="title">
                        <font color="white" size="+2">Urna Eletrônica</font>
                    </td>
                </tr>
                <tr>
                    <td align="center">Opções de votos:</td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="voto" value="blue" id="blueRadio" checked />
                        <label for="blueRadio"><font color="blue">AZUL</font></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="voto" value="green" id="greenRadio" />
                        <label for="greenRadio"><font color="green">VERDE</font></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="voto" value="purple" id="purpleRadio" />
                        <label for="purpleRadio"><font color="purple">ROXO</font></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="voto" value="red" id="redRadio" />
                        <label for="redRadio"><font color="red">VERMELHO</font></label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="centered-button">
                            <div class="button-container">
                                <input type="submit" value="Votar" name="cmd" class="full-width-button">
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
