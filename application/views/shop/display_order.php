<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <style>
            table,td,th {
                border: 1px solid blue;
            }
        </style>
    </head>
    <body>
        <form method="post" action="">
            <select name="selected_id">
                <?php
                foreach ($all_orders as $orderEntry) { ?>
                <option value="<?php echo $orderEntry->order_id; ?>"><?php date_default_timezone_set('America/Los_Angeles'); echo $orderEntry->order_id . date(" --> F j, Y, g:i a", $orderEntry->order_created_at); ?>
                <?php } ?>
            </select>
            <?php echo form_submit('', 'Search') ?><br>
            <?php if(isset($cust_id)) { ?>
            Customer ID: <?php echo $cust_id;?><br>
            First Name: <?php echo $cust_details->cust_first_name; ?><br>
            Last Name: <?php echo $cust_details->cust_last_name; ?><br>
            Address: <?php echo $cust_details->cust_address; ?><br>
            <table>
                <tr>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Item Price</th>
                    <th>Sub-Total</th>
                </tr>
            <?php 
                $order_details = unserialize($ods->order_details);
                $total = 0;
                foreach ($order_details as $one_order) {
                    ?>
                <tr>
                <td>
                    <?php echo $one_order['qty']; ?>
                </td>
                <td>
                    <?php echo $one_order['name']; ?>
                </td>
                <td>
                    <?php echo '$' . $one_order['price']; ?>
                </td>
                <td>
                    <?php echo '$' . $one_order['subtotal']; $total = $total + $one_order['subtotal']; ?>
                </td>
                </tr>
            <?php
                }
                ?>
                <tr>
                <td colspan="2"></td>
                <th>Total</th>
                <td><?php echo '$' . $total; ?></td>
                </tr>
                <?php
            }
            ?>
            </table>
        </form>
    </body>
</html>
