require_relative './card.rb'
require_relative './deck.rb'
require_relative './player_move.rb'
require_relative './game_class.rb'

require 'colorize'
require 'tty-prompt'
prompt = TTY::Prompt.new




# ==================================== ASCII ART ===============================================================
asci_hit = 
"                                                     
HHHHHHHHH     HHHHHHHHH  iiii TTTTTTTTTTTTTTTTTTTTTTT
H:::::::H     H:::::::H i::::iT:::::::::::::::::::::T
H:::::::H     H:::::::H  iiii T:::::::::::::::::::::T
HH::::::H     H::::::HH       T:::::TT:::::::TT:::::T
  H:::::H     H:::::H  iiiiiiiTTTTTT  T:::::T  TTTTTT
  H:::::H     H:::::H  i:::::i        T:::::T        
  H::::::HHHHH::::::H   i::::i        T:::::T        
  H:::::::::::::::::H   i::::i        T:::::T        
  H:::::::::::::::::H   i::::i        T:::::T        
  H::::::HHHHH::::::H   i::::i        T:::::T        
  H:::::H     H:::::H   i::::i        T:::::T        
  H:::::H     H:::::H   i::::i        T:::::T        
HH::::::H     H::::::HH i::::i      TT:::::::TT      
H:::::::H     H:::::::H i::::i      T:::::::::T      
H:::::::H     H:::::::H i::::i      T:::::::::T      
HHHHHHHHH     HHHHHHHHHiiiiiiii     TTTTTTTTTTT      
                                                     "

 asci_doubledown =
"                                                                                                       
bbbbbbbb                                        
DDDDDDDDDDDDD                                          b::::::b           lllllll                     
D::::::::::::DDD                                       b::::::b           l:::::l                     
D:::::::::::::::DD                                     b::::::b           l:::::l                     
DDD:::::DDDDD:::::D                                     b:::::b           l:::::l                     
D:::::D    D:::::D    ooooooooooo   uuuuuu    uuuuuu  b:::::bbbbbbbbb     l::::l     eeeeeeeeeeee    
D:::::D     D:::::D oo:::::::::::oo u::::u    u::::u  b::::::::::::::bb   l::::l   ee::::::::::::ee  
D:::::D     D:::::Do:::::::::::::::ou::::u    u::::u  b::::::::::::::::b  l::::l  e::::::eeeee:::::ee
D:::::D     D:::::Do:::::ooooo:::::ou::::u    u::::u  b:::::bbbbb:::::::b l::::l e::::::e     e:::::e
D:::::D     D:::::Do::::o     o::::ou::::u    u::::u  b:::::b    b::::::b l::::l e:::::::eeeee::::::e
D:::::D     D:::::Do::::o     o::::ou::::u    u::::u  b:::::b     b:::::b l::::l e:::::::::::::::::e 
D:::::D     D:::::Do::::o     o::::ou::::u    u::::u  b:::::b     b:::::b l::::l e::::::eeeeeeeeeee  
D:::::D    D:::::D o::::o     o::::ou:::::uuuu:::::u  b:::::b     b:::::b l::::l e:::::::e           
DDD:::::DDDDD:::::D  o:::::ooooo:::::ou:::::::::::::::uub:::::bbbbbb::::::bl::::::le::::::::e          
D:::::::::::::::DD   o:::::::::::::::o u:::::::::::::::ub::::::::::::::::bl::::::l e::::::::eeeeeeee  
D::::::::::::DDD      oo:::::::::::oo   uu::::::::uu:::ub:::::::::::::::b l::::::l  ee:::::::::::::e  
DDDDDDDDDDDDD           ooooooooooo       uuuuuuuu  uuuubbbbbbbbbbbbbbbb  llllllll    eeeeeeeeeeeeee  
DDDDDDDDDDDDD                                                                                          
D::::::::::::DDD                                                                                       
D:::::::::::::::DD                                                                                     
DDD:::::DDDDD:::::D                                                                                    
D:::::D    D:::::D   oooooooooooo  wwwwwww           wwwww           wwwwwwwnnnn  nnnnnnnn            
D:::::D     D:::::D oo:::::::::::oow:::::w         w:::::w         w:::::w n:::nn::::::::nn          
D:::::D     D:::::Do:::::::::::::::ow:::::w       w:::::::w       w:::::w  n::::::::::::::nn         
D:::::D     D:::::Do:::::ooooo:::::o w:::::w     w:::::::::w     w:::::w   nn:::::::::::::::n        
D:::::D     D:::::Do::::o     o::::o  w:::::w   w:::::w:::::w   w:::::w      n:::::nnnn:::::n        
D:::::D     D:::::Do::::o     o::::o   w:::::w w:::::w w:::::w w:::::w       n::::n    n::::n        
D:::::D     D:::::Do::::o     o::::o    w:::::w:::::w   w:::::w:::::w        n::::n    n::::n        
D:::::D    D:::::D o::::o     o::::o     w:::::::::w     w:::::::::w         n::::n    n::::n        
DDD:::::DDDDD:::::Do:::::ooooo:::::o      w:::::::w       w:::::::w          n::::n    n::::n        
D:::::::::::::::DD o:::::::::::::::o       w:::::w         w:::::w           n::::n    n::::n        
D::::::::::::DDD    oo:::::::::::oo         w:::w           w:::w            n::::n    n::::n        
DDDDDDDDDDDDD         ooooooooooo            www             www             nnnnnn    nnnnnn        
                                                
                                                
                                                
                                                
                                                
                                                
"                                                                                         

 asci_stand = 
"                                                                                    ddddddd
SSSSSSSSSSSSSSS       tttt                                                           d:::::d
SS:::::::::::::::S   ttt:::t                                                         d:::::d
S:::::SSSSSS::::::S  t:::::t                                                         d:::::d
S:::::S     SSSSSSS  t:::::t                                                         d:::::d 
S:::::S         ttttttt:::::ttttttt     aaaaaaaaaaaaa   nnnn  nnnnnnnn       ddddddddd:::::d 
S:::::S         t:::::::::::::::::t     a::::::::::::a n:::nn::::::::nn    dd::::::::::::::d 
S::::SSSS       t:::::::::::::::::t     aaaaaaaaa:::::a n::::::::::::::nn  d:::::::::::::::d 
SS::::::SSSSSt  ttttt:::::::tttttt              a::::a nn:::::::::::::::nd:::::::ddddd:::::d 
 SSS::::::::SS     t:::::t              aaaaaaa::::::a  n:::::nnnn:::::nd::::::d    d::::::d 
    SSSSSS::::S    t:::::t            aa:::::::::::::a  n::::n    n::::nd:::::d     d::::::d 
         S:::::S   t:::::t           a::::aaaa:::::::a  n::::n    n::::nd:::::d     d::::::d 
          S:::::S   t:::::t    tttttta::::a    a:::::a  n::::n    n::::nd:::::d     d::::::d 
SSSSSSS    S:::::S   t::::::tttt:::::ta::::a    a:::::a n::::n    n::::nd::::::ddddd::::::dd
S::::::SSSSSS:::::S   tt::::::::::::::ta:::::aaaa::::::an::::n    n::::n d:::::::::::::::::d
S:::::::::::::::SS     tt:::::::::::tt a::::::::::aa:::an::::n    n::::n  d:::::::::ddd::::d
SSSSSSSSSSSSSSS         ttttttttttt    aaaaaaaaaa  aaaa nnnnnn    nnnnnn   ddddddddd   ddddd"
#=======================================================================================================================================
if ARGV[0]
    username = ARGV[0]
else
    begin
        username = prompt.ask("What is your name?".colorize(:cyan).on_light_white) do |q|
            q.required true
            q.modify :strip, :capitalize
        end
        username = ARGV[0] if ARGV[0]
        username.is_a?(String) ? username = username : 'TypeERROR: Invalid input. Name must be string'
    end until username.is_a?(String)
end

puts "Welcome to Blackjack #{username}. Please take any seat you like".colorize(:cyan).on_light_white
puts "*#{username} sits on an empty table*".colorize(:cyan).on_light_white

begin
    
    money = prompt.ask("Dealer: How much will you be playing with?".colorize(:red).on_black, convert: Float) do |q| 
        q.required true, 
        q.convert(:float, "Wrong value of %{value} to be used for money")
    end
    
    puts "You must have at least $1 dollar to play" if money < 1 

end until  money.is_a?(Float) && money >= 1

#----------------- Player Object intialized ----------------------
user = Player.new(username, money)
computer = Player.new("Dealer", 100000.to_f)

begin
    # ---------- Cards Dealt --------------------
    blackjack = Game.new
    begin
        blackjack.bank = user.bank.to_f
        blackjack.bet = prompt.ask("Dealer: How much would you like to bet?".colorize(:red).on_black, convert: Float) do |q| 
            q.required true, 
            q.convert(:float, "Wrong value of %{value} to be used to bet.")
        end
        puts "Must bet at least $1" if blackjack.bet <= 0
        puts 'Dont have enough money!' if blackjack.bet > user.bank 

    end until blackjack.bet <= user.bank and blackjack.bet >= 1

   
    # ---------- Print board while playing. --------------------
    begin
        blackjack.print_board
        puts "#{user.name}\'s turn."
        option = prompt.select('Please select one of the following options:', %w(Hit DoubleDown Stand))
        
        case option
        when 'Hit'
            puts asci_hit 
            blackjack.hit
        when 'DoubleDown'
            puts asci_doubledown
            blackjack.double_down
        when 'Stand'
            puts asci_stand
            blackjack.stand
        end

    end until blackjack.turn == 'Dealer'

    blackjack.compare

    user.bank = blackjack.bank.to_i


    puts "Now you have #{user.bank}"
    if user.bank < 1
        puts "Unfortunately you are out of money"
        puts 'Dealer: Thank you for playing. Have a nice day.'.colorize(:red).on_black
        break
    else
        continue = prompt.yes?('Play again?')
    end

    if continue
        puts 'Dealer: Wise choice.'.colorize(:red).on_black
    else
        puts "*#{username} has left the table*".colorize(:cyan).on_light_white
        puts 'Dealer: Thank you for playing. Have a nice day.'.colorize(:red).on_black
        break
    end

end until user.bank < 1
