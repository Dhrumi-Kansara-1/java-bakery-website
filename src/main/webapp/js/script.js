//alert("hello");
function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if(cart==null || cart==[]) {
        //no cart yet
        let products = [];
        
        let product = {
            productId: pid,
            productName: pname,
            productQuantity: 1,
            productPrice:price
        };
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        alert("item added to cart");
    }
    else {
        //cart present
        let pcart = JSON.parse(cart);
        
        let oldProduct = pcart.find((item)=>item.productId==pid);
        
        if(oldProduct) {
            //increse the quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1;
            pcart.map((item)=>{
                if(item.productId==oldProduct.productId) {
                    item.productQuantity=oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart",JSON.stringify(pcart));
            alert(`${oldProduct.productName} quantity is increased`);
            
        }
        else {
            
            //add the product
            let product = {
                productId: pid,
                productName: pname,
                productQuantity: 1,
                productPrice:price
            };
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
            alert("item is added to cart");
        }
        
    }
    updateCart();
}


//update cart
function updateCart() {
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart==null || cart.lengeth<=0 || cart==[]) {
        
        
        console.log("cart is empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h5>Cart does not have any items</h5>");
        $(".checkout-btn").addClass("btn-disable");
   
    }
    else {
        //there is something in cart to show
        
        $(".cart-items").html(`( ${cart.length} )`);
        let table=`
            <table class='table table-striped' >
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total price</th>
                        <th>Action</th>
                    <tr>
                </thead> 
            `;
        let totalPrice=0;
        cart.map((item)=>{
            totalPrice+=(item.productPrice*item.productQuantity);
           table+=`
           <tr>
                <td>${item.productName}</td>
                <td>&#x20B9 ${item.productPrice}</td>
                <td>${item.productQuantity}</td>
                <td>&#x20B9 ${item.productQuantity * item.productPrice}</td>
                <td>
                    <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-outline-danger btn-sm'>Remove</button>
                </td>
           </tr>
        `; 
        });
        
        table=table+`
                <tr>
                    <td colspan="5" class="text-right text-white bg-secondary"><spam class="font-weight-bold">Total Price:</spam> &#x20B9 ${totalPrice}</td>
                <tr>
                </table>`;
        
        $(".cart-body").html(table); 
        $(".checkout-btn").removeClass("btn-disable");
    }
    
}


//delete item
function deleteItemFromCart(pid) {
    let cart=JSON.parse(localStorage.getItem("cart"));
    
    let newCart=cart.filter((item)=>item.productId!=pid);
    console.log(newCart.length);
    if(newCart.length==0) {
        
        $(".checkout-btn").addClass("btn-disable");
        console.log("length1"); 
    }
    localStorage.setItem("cart",JSON.stringify(newCart));
    
    updateCart();
}


$(document).ready(function() {
    updateCart();
});


//checkout
function goTOCheckout() {
    let cart=JSON.parse(localStorage.getItem("cart"));
    
    let cartLength=cart.length;
    if(cartLength==0){
        alert("cart is empty !! please add item to cart for checkout");
    }
    else {
        window.location="checkout.jsp?cartLength="+cartLength;
    }

}