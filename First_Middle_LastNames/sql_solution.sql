select  
CUSTOMER_NAME,case when substr(CUSTOMER_NAME,1,instr(CUSTOMER_NAME,' ',1)-1) IS NULL  then CUSTOMER_NAME  
    				else substr(CUSTOMER_NAME,1,instr(CUSTOMER_NAME,' ',1)-1) END first_name ,
    substr(CUSTOMER_NAME,instr(CUSTOMER_NAME,' ',1)+1 ,instr(CUSTOMER_NAME,' ',-1,1)-instr(CUSTOMER_NAME,' ',1,1)-1) as middle_name,
     case when  instr(CUSTOMER_NAME,' ',1)!=0 then substr(CUSTOMER_NAME,instr(CUSTOMER_NAME,' ',-1,1)+1)
        else null end lastname
    from customers 
