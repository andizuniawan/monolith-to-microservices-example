<#--
Copyright 2020 Google LLC. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<#include "header.ftl">
<main role="main">
   <div class="py-5">
      <div class="container bg-light py-3 px-lg-5 py-lg-5">
         <#if cart?size==0>
         <h3>Your shopping cart is empty!</h3>
         <p>Items you add to your shopping cart will appear here.</p>
         <a class="btn btn-primary" href="/" role="button">Browse Products &rarr; </a>
         <#else>
         <div class="row mb-3 py-2">
            <div class="col">
               <h3>${cart?size} item in your Shopping Cart</h3>
            </div>
            <div class="col text-right">
               <form method="POST" action="/cart/empty">
                  <button class="btn btn-secondary" type="submit">Empty cart</button>
                  <a class="btn btn-info" href="/" role="button">Browse more products &rarr; </a>
               </form>
            </div>
         </div>
         <hr>
         <#list cart as item>
         <div class="row pt-2 mb-2">
            <div class="col text-right">
               <a href="/product/${item.id}"><img class="img-fluid" style="width: auto; max-height: 60px;"
                  src="${item.picture}" /></a>
            </div>
            <div class="col align-middle">
               <strong>${item.name}</strong><br/>
               <small class="text-muted">SKU: #${item.id}</small>
            </div>
            <div class="col text-left">
               <strong>
               ${item.priceUsd}
               </strong>
            </div>
         </div>
         </#list>
         <hr/>
         <div class="row py-3 my-2">
            <div class="col-12 col-lg-8 offset-lg-2">
               <h3>Checkout</h3>
               <form action="/cart/checkout" method="POST">
                  <div class="form-row">
                     <div class="col-md-5 mb-3">
                        <label for="email">E-mail Address</label>
                        <input type="email" class="form-control" id="email"
                           name="email" value="someone@example.com" required>
                     </div>
                     <div class="col-md-5 mb-3">
                        <label for="street_address">Street Address</label>
                        <input type="text" class="form-control"  name="street_address"
                           id="street_address" value="1600 Amphitheatre Parkway" required>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="zip_code">Zip Code</label>
                        <input type="text" class="form-control"
                           name="zip_code" id="zip_code" value="94043" required pattern="\d{4,5}">
                     </div>
                  </div>
                  <div class="form-row">
                     <div class="col-md-5 mb-3">
                        <label for="city">City</label>
                        <input type="text" class="form-control" name="city" id="city"
                           value="Mountain View" required>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="state">State</label>
                        <input type="text" class="form-control" name="state" id="state"
                           value="CA" required>
                     </div>
                     <div class="col-md-5 mb-3">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" id="country"
                           placeholder="Country Name" 
                           name="country" value="United States" required>
                     </div>
                  </div>
                  <div class="form-row">
                     <div class="col-md-6 mb-3">
                        <label for="credit_card_number">Credit Card Number</label>
                        <input type="text" class="form-control" id="credit_card_number"
                           name="credit_card_number"
                           placeholder="0000-0000-0000-0000"
                           value="4432-8015-6152-0454"
                           required pattern="\d{4}-\d{4}-\d{4}-\d{4}">
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_expiration_month">Month</label>
                        <select name="credit_card_expiration_month" id="credit_card_expiration_month"
                           class="form-control">
                           <option value="1">January</option>
                           <option value="2">February</option>
                           <option value="3">March</option>
                           <option value="4">April</option>
                           <option value="5">May</option>
                           <option value="6">June</option>
                           <option value="7">July</option>
                           <option value="8">August</option>
                           <option value="9">September</option>
                           <option value="10">October</option>
                           <option value="11">November</option>
                           <option value="12">December</option>
                        </select>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_expiration_year">Year</label>
                        <select name="credit_card_expiration_year" id="credit_card_expiration_year"
                           class="form-control">
                        {{ range $i, $y := $.expiration_years}}<option value="{{$y}}"
                        {{if eq $i 1 -}}
                        selected="selected"
                        {{- end}}
                        >{{$y}}</option>{{end}}
                        </select>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_cvv">CVV</label>
                        <input type="password" class="form-control" id="credit_card_cvv"
                           autocomplete="off"
                           name="credit_card_cvv" value="672" required pattern="\d{3}">
                     </div>
                  </div>
                  <div class="form-row">
                     <button class="btn btn-primary" type="submit">Place your order &rarr;</button>
                  </div>
               </form>
            </div>
         </div>
         </#if>
         <#if recommend??>
         <#include "recommendations.ftl">
         </#if>
      </div>
   </div>
</main>
<#include "footer.ftl">

