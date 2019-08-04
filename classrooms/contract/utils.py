import zeep

class MagentoSoap():

    def __init__(self, wsdl, username, apiKey):
        self.client = zeep.Client(wsdl=wsdl)
        self.username = username
        self.apiKey = apiKey
        self.has_session_id = False

    def start_batch_operations(self):
        self.session_id = self.client.service.login(username=self.username, apiKey=self.apiKey)

    def end_batch_operations(self):
        self.client.service.endSession(self.session_id)
    
    def has_customer_purchased_product_after_date(self, customer_email, sku, date):
        sales_list = self.get_sales_list_for_user_by_email_after_inclusive_date(customer_email, date)
        for sale in sales_list:
            sale_order_increment_id = sale['increment_id']
            try:
                order_info = self.client.service.salesOrderInfo(self.session_id, sale_order_increment_id)
                for order_item in order_info['items']:
                    print('order_item', order_item)
                    if order_item['sku'] == sku:
                        return True
            except:
                pass
        return False

    def has_customer_purchased_product(self, customer_email, sku):
        filters = { 
            'filter': [
                { 
                    'key': 'customer_email', 
                    'value': customer_email
                }
            ]
        }

        sales_list = self.client.service.salesOrderList(sessionId=self.session_id, filters=filters)
        print('orders purchased:', len(sales_list))
        for sale in sales_list:
            sale_order_increment_id = sale['increment_id']
            try:
                order_info = self.client.service.salesOrderInfo(self.session_id, sale_order_increment_id)
                print('items count purchased:', len(order_info['items']))
                for order_item in order_info['items']:
                    print('order_item_sku', order_item['sku'])
                    if order_item['sku'] == sku:
                        return True
            except:
                pass
        return False

    def get_sales_list_for_user_by_email_after_inclusive_date(self, email, date):
        filters = { 
            'filter': [
                { 
                    'key': 'customer_email', 
                    'value': email
                }
            ],
            'complex_filter': [
               {
                    'key': 'created_at',
                    'value': {
                        'key': 'from',
                        'value': date
                    }
                }
            ]
        }
        return self.client.service.salesOrderList(sessionId=self.session_id, filters=filters)