<?php
function EnviarCorreo($asunto,$contenido,$destinatario)
        {
            require 'PHPMailer/src/PHPMailer.php';
            require 'PHPMailer/src/SMTP.php';
    
            $correoSalida = "scastro50555@ufide.ac.cr";
            $contrasennaSalida = "Secasaljunio02";
    
            $mail = new PHPMailer();
            $mail -> CharSet = 'UTF-8';
    
            $mail -> IsSMTP();
            $mail -> IsHTML(true); 
            $mail -> Host = 'smtp.office365.com';
            $mail -> SMTPSecure = 'tls';
            $mail -> Port = 587;                      
            $mail -> SMTPAuth = true;
            $mail -> Username = $correoSalida;               
            $mail -> Password = $contrasennaSalida;                                
            
            $mail -> SetFrom($correoSalida);
            $mail -> Subject = $asunto;
            $mail -> MsgHTML($contenido);   
            $mail -> AddAddress($destinatario);
    
            try
            {
                if ($mail->send()) 
                {
                    return true; // Envío exitoso
                } 
                else 
                {
                    return true; // Falló el envío
                }
            } catch (Exception $e) 
            {
                return false;
            }
        }
        
?>