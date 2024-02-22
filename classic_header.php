<table class="tabheader">
			<tr>
				<th class="tableheader"><a href="home.php" ><img  style='width: 75px;height: 75px;'  alt="Parking" src="images/logo.png" class="logo"></a></th>
				
				<?php 
				if(isset($_SESSION['id'])) {
				
				}
				if (isset($_POST['nightmode'])) {
					setcookie("nightmode",$_POST['nightmode']);
					header("Location:".$_SERVER['PHP_SELF']);
				}
				if(!isset($_COOKIE['nightmode'])) {
					setcookie("nightmode", "false");
					header("Location:".$_SERVER['PHP_SELF']);
				}
				$nonightmode = explode("/", $_SERVER['PHP_SELF'])[2];
				
				if($_COOKIE["nightmode"] == "false"){
					echo "<link rel='stylesheet' type='text/css' href='sudokuware.css'>";
				}
				else{
					echo "<link rel='stylesheet' type='text/css' href='css/sudokuware_nightmode.css'>";
				}
				if($nonightmode != "Game.php" and $nonightmode != "Conceptor.php"){
					if($_COOKIE["nightmode"] == "false"){
						echo "<form method='POST'>
								<th class='tableheader'><button class='input-button' type='submit' name='nightmode' value='true'>Mode Sombre</button></th>
							</form>";
					}
					else {
						echo "<form method='POST'>
								<th class='tableheader'><button class='input-button' type='submit' name='nightmode' value='false'>Mode Clair</button></th>
							</form>";
					}
				}
				
				if(isset($_SESSION['id'])) {
					echo "<th class='tableheader'><a href='Ranking.php'><button class='input-button'> Ranking </button></a></th>";
					echo "<th class='tableheader'><a href='Chatbox.php'><button class='input-button'> Chatbox </button></a></th>";
					echo "<th class='tableheader'><a href='disconnect.php'><button class='input-button'> Log out </button></a></th>";
					echo "<th class='tableheader'><a href='Profile.php?id=$id'><img style='border-radius: 50%; width: 36px;height: 36px;' alt='$icon' src=images/icons/$icon></a></th>
					</table>";
				}
				else {
					echo "<th class='tableheader'><a href='Connection_register.php'><button class='input-button'> Log in </button></a></th>";
				}
				?>
			</tr>
		</table>
