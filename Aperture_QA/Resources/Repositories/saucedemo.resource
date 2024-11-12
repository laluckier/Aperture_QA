*** Variables ***
# common
${mnu_hamburger}                       //button[@id="react-burger-menu-btn"]
${lbl_title}                           //span[@class="title"]
${icn_cart}                            //*[@id="shopping_cart_container"]
${btn_remove_item}                     //button[contains(@id, "remove")]

# Login Page
${lbl_title}                           //div[@class="login_logo"]
${txt_username}                        //input[@id="user-name"]
${txt_password}                        //input[@id="password"]
${btn_login}                           //input[@id="login-button"]
${pnl_login_credentials}               //div[@id="login_credentials"]
${pnl_password}                        //div[@class="login_password"]

# Error Messages
${lbl_error_msg}                       //h3[@data-test="error"]
${btn_close_error}                     //button[@class="error-button"]
${icn_error_username}                  //*[@data-icon="times-circle"]//..//input[@id="user-name"]
${icn_error_password}                  //*[@data-icon="times-circle"]//..//input[@id="password"]

# Products Page
${btn_sort}                            //span[@class="select_container"]
${lbl_active_sort}                     //span[@class="active_option"]
${lst_sort_a_z}                        //select[@class="product_sort_container"]/option[@value="az"]
${lst_sort_z_a}                        //select[@class="product_sort_container"]/option[@value="za"]
${lst_sort_low_high}                   //select[@class="product_sort_container"]/option[@value="lohi"]
${lst_sort_high_low}                   //select[@class="product_sort_container"]/option[@value="hilo"]
${lst_items}                           //div[@class="inventory_item"]
${lst_items_name}                      //div[@class="inventory_item_name"]
${lst_items_desc}                      //div[@class="inventory_item_desc"]
${lst_items_price}                     //div[@class="inventory_item_price"]
${btn_add_to_cart}                     //button[contains(@id, "add")]

# Cart Page
${lbl_qty}                             //div[@class="cart_quantity_label"]
${lbl_desc}                            //div[@class="cart_desc_label"]
${pnl_items}                           //div[@class="cart_item"]
${lbl_items_qty}                       //div[@class="cart_item"]/div[@class="cart_quantity"]
${lbl_items_name}                      //div[@class="cart_item"]//div[@class="inventory_item_name"]
${lbl_items_desc}                      //div[@class="cart_item"]//div[@class="inventory_item_desc"]
${lbl_items_price}                     //div[@class="cart_item"]//div[@class="inventory_item_price"]
${btn_continue_shopping}               //*[@id="continue-shopping"]
${btn_checkout}                        //*[@id="checkout"]

# Checkout Page
${txt_firstname}                       //input[@id="first-name"]
${txt_lastname}                        //input[@id="last-name"]
${txt_zip_code}                        //input[@id="postal-code"]
${icn_error_firstname}                 //*[@data-icon="times-circle"]//..//input[@id="first-name"]
${icn_error_lastname}                  //*[@data-icon="times-circle"]//..//input[@id="last-name"]
${icn_error_zip_code}                  //*[@data-icon="times-circle"]//..//input[@id="postal-code"]
${btn_cancel}                          //button[@id="cancel"]
${btn_continue}                        //input[@id="continue"]

# Overview Page
${lbl_payment}                         //div[@class="summary_info_label"][@data-test="payment-info-label"]
${lbl_detail_payment}                  //div[@class="summary_value_label"][@data-test="payment-info-value"]
${lbl_shipping}                        //div[@class="summary_info_label"][@data-test="shipping-info-label"]
${lbl_detail_shipping}                 //div[@class="summary_value_label"][@data-test="shipping-info-value"]
${lbl_price_total}                     //div[@class="summary_info_label"][@data-test="total-info-label"]
${lbl_detail_item_total}               //div[@class="summary_subtotal_label"]
${lbl_detail_tax}                      //div[@class="summary_tax_label"]
${lbl_detail_price_total}              //div[@class="summary_total_label"]
${btn_finish}                          //button[@id="finish"]

# Complete Page
${img_express}                         //*[@data-test="pony-express"]
${lbl_complete_header}                 //h2[@class="complete-header"]
${lbl_complete_desc}                   //div[@class="complete-text"]
${btn_back_home}                       //*[@id="back-to-products"]

