select * from production.brand
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

INSERT into production.categories VALUES (N'ຢ່າງລົດ')

select brand_id "ລຳດັບຍິຫໍ້", brand_name "ຍິຫໍ້ສິນຄ້າ" from production.brand

select category_id "ລຳດັບປະເພດ", category_name "ປະເພດສິນຄ້າ" from production.categories

select product_id "ລຳດັບສິນຄ້າ", product_name "ຊື່ສິນຄ້າ", brand_id "ລຳດັບຍິຫໍ້", category_id "ລຳດັບປະເພດ", model_year "ປີພະລິດ", list_price "ລາຄາ" from production.products

select store_id "ລຳດັບຮ້ານຄ້າ", product_id "ລະຫັດສິນຄ້າ", quantity "ຈຳນວນ" from production.stocks

select customer_id "ລຳດັບລູກຄ້າ", first_name "ຊື່ເເທ້", last_name "ນາມສະກຸນ", phone "ເບີໂທ", email "ອີເມວ", street "ເຂດ", city "ເມືອງ", state "ເເຂວງ", zip_code "ລະຫັດທີ່ບ້ານ" from sales.customers

select order_id "ລຳດັບບິນ", item_id "ໝາຍເລກສິນຄ້າ", product_id "ລຳດັບສິນຄ້າ", quantity "ຈຳນວນ", list_price "ລາຄາ", discount "ສ່ວນລົດ" from Sales.order_items

select order_id "ລຳດັບບິນ", customer_id "ລຳດັບລູກຄ້າ", order_status "ສະຖານະບິນ", order_date "ວັນທີ່ອອກບິນ", required_date "ວັນທີ່ຢືນຢັນບິນ", shipped_date "ວັນທີ່ຈັດສົ່ງ", store_id "ລຳດັບລະຫັດ", staff_id "ລຳດັບພະນັກງານ" from sales.orders

select staff_id "ລຳດັບພະນັກງານ", first_name "ຊື່ເເທ້", last_name "ນາມສະກຸນ", email "ອີເມວ", phone "ເບີໂທ", active "ເເອັກທິບ", store_id "ລຳດັບລະຫັດ", manager_id "ລະຫັດຜູ້ຈັດການ" from sales.staffs

select store_id "ລຳດັບຮ້ານຄ້າ", store_name "ຊື່ຮ້ານຄ້າ", phone "ເບີໂທ", email "ອີເມວ", street "ເຂດ", city "ເມືອງ", state "ເເຂວງ", zip_code "ລະຫັດທີ່ບ້ານ" from sales.stores