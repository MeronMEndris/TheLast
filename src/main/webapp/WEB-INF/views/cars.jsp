<%--
  Created by IntelliJ IDEA.
  User: edy
  Date: 2/4/20
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car list</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="<c:url value="/resources/css/car.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery.autocomplete.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
   <style type="text/css">
   @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
   </style>

</head>
<body>

<div>
    <input type="text"  id="search" value="">
    <span>
	  <button id="button-id" type="button">Search</button>
	</span>
</div>

<script>
    $(document).ready(function() {

        //alert(1);

        $('#search').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getTags',
            paramName: "tagName",
            delimiter: ",",
            transformResult: function(response) {

                return {
                    //must convert json to javascript object before process
                    suggestions: $.map($.parseJSON(response), function(item) {

                        return { value: item.tagName, data: item.id };
                    })

                };

            }

        });

    });
</script>

<div class="container">
    <div class="table-wrapper">

        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Car Brand</th>
                <th>Model</th>
                <th>Year</th>
                <th>Price</th>
                <th>Seats</th>
                <th>Owner</th>
                <th>Location</th>
                <th>Description</th>
                <th>Status</th>
                <th>Rate</th>
                <th>RENT</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="car" items="${list}">
                <tr>
                    <td><a href="editcar/${car.id}">${car.carBrand}</a></td>
                    <td>${car.model}</td>
                    <td>${car.year}</td>
                    <td>${car.price}</td>
                    <td>${car.seats}</td>
                    <td>${car.owner.userName}</td>
                    <td>${car.pickUpLocation}</td>
                    <td>${car.description}</td>
                    <td><span class="status text-success">&bull;</span> ${car.status}</td>
                    <td><fieldset class="rating">
					    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
					    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
					    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
					    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
					    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
					    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
					    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
					    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
					    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
					    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
						</fieldset>
					</td>
                    <td>
                        <a href="/rent/${car.id}" class="rent" title="Rent" data-toggle="tooltip"><i class="material-icons">directions_car</i></a>
                    </td>
                        <%--                    <td>--%>
                        <%--                        <a href="editcar/${car.id}" class="approve" title="Approve" data-toggle="tooltip"><i class="material-icons">check_circle</i></a>--%>
                        <%--                        <a href="deletecar/${car.id}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">cancel</i></a>--%>
                        <%--                    </td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>