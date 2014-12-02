
all : notes_docx notes_pdf final_docx final_pdf

notes : notes_docx notes_pdf

notes_docx :
	pandoc notes.md -o notes.docx

notes_pdf :
	pandoc notes.md -o notes.pdf

final : final_docx final_pdf

final_docx :
	pandoc final.md -o final.docx

final_pdf :
	pandoc final.md -o final.pdf

final_answers :
	pandoc finalAnswerKey.md -o finalAnswerKey.pdf
	pandoc finalAnswerKey.md -o finalAnswerKey.docx
