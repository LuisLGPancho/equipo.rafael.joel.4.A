<?php 
    
    $to=$_POST['c_email_address'];
    $subject='Gracias por tu compra en mitienda.com';
    $from='tienda@midominio.com';
    $header='MIME-Version 1.0'."\r\n";
    $header.="Content-type: text/html; charset=uft-8\r\n";
    $header.="X-Mailer: PHP".phpversion();
    
    $message='<html>

    <body>
        <h1 style="color:#1d1d1d">Gracias por tu compra '.$_POST['c_fname']." ".$_POST['c_lname'].'</h1>
        
        <h3>Detalles de la compra</h3>
        <table>
            <thead>
                <tr>
                    <td>Nombre del Producto</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                    <td>Subtototal</td>

                </tr>
            </thead>
            <tbody>';
    $total = 0; 
                            
    $arregloCarrito =$_SESSION['carrito'];
    for($i=0;$i<count($arregloCarrito);$i++){
        $total=$total + ( $arregloCarrito[$i]['Precio'] * $arregloCarrito[$i]['Cantidad'] );
        $message.='<tr><td>'. $arregloCarrito[$i]['Nombre'].'</td>';
        $message.='<td>'. $arregloCarrito[$i]['Precio'].'</td>';
        $message.='<td>'. $arregloCarrito[$i]['Cantidad'].'</td>';
        $message.='<td>'. ($arregloCarrito[$i]['Precio']*$arregloCarrito[$i]['Cantidad']).'</td></tr>';
    }
    
    $message.='</tbody></table>';
    $message.='<h2>Total de compra: '.$total.'</h2>';
    $message.='<a href="http://localhost/carrito/verpedido.php?id_venta='.$id_venta.'" style="background-color: brown;color:white;padding: 10p:">
            Ver Status del pedido
    </a>  </body></html>';
    

    if(mail($to,$subject,$message,$header)){
        //echo "mensaje enviado correctamente";
    }else{
        //echo 'no se puedo enviar el email';
    }
?>
            
        
        
        
    

