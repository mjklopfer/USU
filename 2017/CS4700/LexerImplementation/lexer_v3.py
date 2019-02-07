#Nathan Tipton Lexer Assignment 
#A01207112

#****Tokens****
#(ID name) Max length of 255 characters, must start with letter
#(LIT value) for a literal value
#(keyword symbol) for a keyword
#(PUNCT text) operators and delimiters
#(ENDMARKER) for the end of the input

keywords=['abstract','continue','for','new','switch','assert','default','if','package','synchronized','boolean','do','goto','private'
        ,'this','break','double','implements','protected','throw','byte','else','import','public','throws','case','enum','instanceof',
        'return','transient','catch','extends','int','short','try','char','final','interface','static','void','class','finally','long'
        ,'strictfp','volatile','const','float','native','super','while']
punct=['(',')','{','}','[',']',';',',','.','=','<','>','!','~','?',':','==','<=','>=','!=','$$','||','++','--','+','-','*','/','&','|'
        ,'^','%','<<','>>','>>>','+=','-=','*=','/=','&=','|=','^=','%=','<<=','>>=','>>>=']
vals=['+','-','*','/','&','<','>','!','|','^','%','=']

litstring=['null','true','false']
chartype=""
lexeme=""
character=''
inputfile=open("HelloWorldError.java")
idcontinue=False
litcontinue=False
stringcontinue=False
error=False

def getChar():
	global character
	character=inputfile.read(1)


def getChartype():
	global character
	global chartype
	if character.isalpha():
                chartype="LETTER"
        elif character.isdigit():
                chartype="DIGIT"
        elif character=="":
                chartype="EOF"
        elif character.isspace():
                chartype="SPACE"
	elif character=="\r":
		chartype="SPACE"
	elif character=="\"" or character=="\'":
		chartype="STRING"
        else:
                chartype="PUNCT"
        return chartype


def printChar():

	global character
	global chartype
	getChar()
	getChartype()
	print character+" "+chartype

def addChar():
	global character
	global lexeme
	if len(lexeme)<255:
		lexeme=lexeme+character
	else:
		error=True
		print "(Error: lexeme too long "+lexeme+" )"
	return lexeme
def printIDkey():
	global lexeme

	if lexeme in keywords:
		print "(KEYWORD "+"\""+lexeme+"\""+" )"
		lexeme=""
	elif lexeme in litstring:
		print "(LIT "+"\""+lexeme+"\""+" )"
	else:
		print "(ID "+"\""+lexeme+"\""+" )"
		lexeme=""
	
	
def printlitval():
	global lexeme
	global error
	global stringcontinue
	
	if stringcontinue:
		print"(LIT "+lexeme+" )"
		lexeme=""
		return
	litval=int(lexeme)
	if litval>((2**15)-1):
		error=True
		print "(ERROR: LIT VALUE OUT OF BOUNDS. LIT="+lexeme+" )"
	else:
		print "(LIT "+"\""+lexeme+"\""+" )"
	lexeme=""
	
def printPunct():
	global lexeme
	global error
	if lexeme in punct: 
		print"(PUNCT "+"\""+lexeme+"\""+" )"
	else:
		error=True
		print"(ERROR: ILLEGAL CHARACTER: "+lexeme+" )"
	lexeme=""

def iderror():
	global error
	global lexeme
	error=True
	print "(ERROR: ID CANNOT START WITH NUMBER: "+lexeme+" )"

def multpunct():

	global character
	addChar()
	getChar()
	getChartype()
	if character=="=":
		addChar()
		printPunct()
	else:
		printPunct()

def lexer():
	global litcontinue
	global idcontinue
	global lexeme
	global character
	global chartype
	global error
	global stringcontinue
	if chartype=="LETTER" and idcontinue==False and litcontinue==False and stringcontinue==False:
		addChar()
		getChar()
		getChartype()
		idcontinue=True
	elif (chartype=="LETTER" or chartype=="DIGIT" or chartype=="PUNCT") and stringcontinue==True:
		addChar()
		getChar()
		getChartype()
	elif (chartype=="LETTER" or chartype=="DIGIT") and idcontinue==True:
		addChar()
		getChar()
		getChartype()
	elif (chartype =="PUNCT") and idcontinue==True:
		printIDkey()
		idcontinue=False
	elif (chartype =="SPACE") and idcontinue==True:
		getChar()
		getChartype()
		printIDkey()
		idcontinue=False
	elif (chartype =="DIGIT") and litcontinue==False:
		addChar()
		getChar()
		getChartype()
		litcontinue=True
	elif (chartype=="DIGIT") and litcontinue==True:
		addChar()
		getChar()
		getChartype()
	elif (chartype=="LETTER") and litcontinue==True:
		iderror()

	elif (chartype =="PUNCT") and litcontinue==True:
		printlitval()
		getChar()
		getChartype()
		litcontinue=False
	elif (chartype=="SPACE") and litcontinue==True:
		printlitval()
		getChar()
		getChartype()
		litcontinue=False
	elif (chartype=="PUNCT") and litcontinue==False and idcontinue == False:
		if character in vals:
			multpunct()


		else:
			addChar()
			getChar()
			getChartype()
			printPunct()
	elif (chartype=="SPACE"):
		getChar()
		getChartype()
	elif (chartype=="STRING") and stringcontinue==False:
		addChar()
		getChar()
		getChartype()
		stringcontinue=True
	elif (chartype=="STRING") and stringcontinue==True:
		addChar()
		printlitval()
		stringcontinue=False
		getChar()
		getChartype()



#************************************************************
getChar()
getChartype()
while chartype != "EOF" and error==False:

	if chartype=="EOF":
		break
	else:
		lexer()
print "(ENDMARKER)"


#Nathan Tipton
#A01207112
