-- proc example 
--Given a customerID, list all orders for that customer
-- raiseerror if the customer does not exist

Create proc GetOrdersForCustomer @customerid int
as
begin
  --check for customer
  declare @customercount int

  select @customercount = count(*)
  from Customers
  where CustomerID = @customerid

  if @customercount = 0
  begin
    raiserror('Bad Request...customer does not exist', 16, 1)
	return -99
  end

  --show orders for customer
  select *
  from Customers
  where customerid = @customerid
end

--test
exec GetOrdersForCustomer 1