<html> 
    <head>
        <title>PHP Form Validation</title>
        <style>
        .des {
        display: block;
        background-color: lightblue;
        width: 40%;
        }
        </style>
    </head>
    <h1> 
        <?php 
            error_reporting(0); 
            $error = array(); 
            function cleaninput($input) 
            { 
                foreach ($input as $key => $value) 
                { 
                    $value = trim($value); 
                    $value = stripslashes($value); 
                    $value = htmlspecialchars($value); 
                } 
                return $input; 
            } 
            function validateinput($input) 
            { 
                if (!array_key_exists("gender", $input)) { 
                    $error["gender"] = "*Specify your gender."; 
                } 
                if (!array_key_exists("hobby", $input)) { 
                $error["hobby"] = "*What are your hobbies?"; 
                } 
    
                foreach ($input as $key => $value)  
                {   
                    switch ($key) 
                    {        
                        case "usr":    
                            if (empty($value)) 
                                $error["usr"] = "*Name cannot be left blank!"; 
                            break; 
    
                        case "email": 
                            if (!filter_var($value, FILTER_VALIDATE_EMAIL)) 
                                $error["email"] = "*Email cannot be left blank!";       
                            break; 
                        case "edu": 
                            if ($value == "--") 
                                $error["edu"] = "*Tell us about your education!"; 
                            break; 

                    case "comment": 
                            if ($value=="") 
                                $error["comment"] = "*This field is required.";        
                            break; 
                    } 
                } 
            //var_dump($error); 
            return $error; 
            } 
            if (isset($_POST["submit-btn"])) { 
                // var_dump($_POST); 
                $cleandata = cleaninput($_POST); 
                $error = validateinput($cleandata); 
            } 
        ?> 
    </h1> 
    <div class = "des">
    <body> 
        <form action="index.php" method="post"> 
            <label>Name</label> 
            <input type="text" name="usr"><br> 
            <div style="color:red"><?php echo $error["usr"]; ?></div><br>
            
            <label>Email</label> 
            <input type="text" name="email"><br> 
            <div style="color:red"><?php echo $error["email"]; ?></div><br>
            
            <label for="edu">Education</label> 
            <select id="edu" name="edu"> 
            <option value="--">--</option> 
            <option value="hsc">HSC</option> 
            <option value="sslc">SSLC</option> 
            <option value="dip">Diplomo</option> 
            <option value="be">B.E</option> 
            </select> 
            <div style="color:red"><?php echo $error["edu"]; ?></div><br>
            
            <label for="gender">Gender</label> 
            <input type="radio" id="gender" name="gender" value="male"> 
            <label for="male">Male</label> 
            <input type="radio" id="gender" name="gender" value="female"> 
            <label for="female">Female</label> 
            <input type="radio" id="gender" name="gender" value="none"> 
            <label for="none">Other</label> 
            <div style="color:red"><?php echo $error["gender"]; ?></div><br> 
            
            <label for="hobbies">Hobbies</label> 
            <input type="checkbox" id="hobby" name="hobby" value="drawing"> 
            <label for="vehicle1">Drawing</label> 
            <input type="checkbox" id="hobby" name="hobby" value="singing"> 
            <label for="vehicle2">Singing</label> 
            <input type="checkbox" id="hobby" name="hobby" value="dancing"> 
            <label for="vehicle3">Dancing</label> 
            <div style="color:red"><?php echo $error["hobby"]; ?></div> <br>
            
            <label for="comment">Comment</label> 
            <br> 
            <textarea rows="4" cols="30" name="comment"></textarea> 
            <div style="color:red"><?php echo $error["comment"]; 
            ?>
            </div> 
            <br><br> 
            <input type="submit" value="Submit" name="submit-btn"> 
        </form> 
    </body> 
</html>
