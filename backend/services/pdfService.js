const fs = require('fs');
const path = require('path');
const PdfPrinter = require('pdfmake');

class PDFService {
   static async generateDiagnosisReport(caseData) {
      return new Promise((resolve, reject) => {
         try {
            const reportsDir = path.join(__dirname, '../reports');
            if (!fs.existsSync(reportsDir)) {
               fs.mkdirSync(reportsDir, { recursive: true });
            }

            const filename = `diagnosis_${caseData._id}_${Date.now()}.pdf`;
            const filepath = path.join(reportsDir, filename);

            // Define fonts
            const fonts = {
               Amiri: {
                  normal: path.join(__dirname, '../fonts/Amiri-Regular.ttf'),
                  bold: path.join(__dirname, '../fonts/Amiri-Bold.ttf'),
                  italics: path.join(__dirname, '../fonts/Amiri-Regular.ttf'),
                  bolditalics: path.join(__dirname, '../fonts/Amiri-Bold.ttf')
               }
            };

            const printer = new PdfPrinter(fonts);

            // PDF content in English
            const docDefinition = {
               content: [
                  { text: 'Mind Bloom', fontSize: 24, bold: true, color: '#7B2CBF', alignment: 'center' },
                  { text: 'ADHD Screening Report', fontSize: 14, alignment: 'center', margin: [0, 0, 0, 0] },
                  { text: `Report Date: ${new Date().toLocaleDateString()}`, alignment: 'left', fontSize: 10 },

                  { canvas: [{ type: 'line', x1: 0, y1: 5, x2: 515, y2: 5, lineWidth: 1 }] },

                  { text: 'Child Information', fontSize: 14, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] },
                  {
                     ul: [
                        `Name: ${caseData.childFirstName} ${caseData.childLastName}`,
                        `Age: ${caseData.childAge}`,
                        `Gender: ${caseData.childSex}`,
                        `Grade: ${caseData.scholarYear}`
                     ], fontSize: 11
                  },

                  { text: 'Parent Information', fontSize: 14, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] },
                  {
                     ul: [
                        `Name: ${caseData.parentId.firstName} ${caseData.parentId.lastName}`,
                        `Relationship to child: ${caseData.parentId.relationToChild}`,
                        `Email: ${caseData.parentId.email}`
                     ], fontSize: 11
                  },

                  { text: 'Screening Results', fontSize: 14, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] },
                  { text: `Severity Score: ${caseData.gravityScore.toUpperCase()}`, fontSize: 11, margin: [0, 0, 0, 2] },
                  { text: 'Questionnaire Responses:', fontSize: 12, bold: true, color: '#7B2CBF' },

                  ...caseData.screeningAnswers.map((qa, index) => ({
                     text: `${index + 1}. ${qa.question}\t   Answer: ${qa.answer}`,
                     fontSize: 10,
                     margin: [0, 1, 0, 1]
                  }))
               ],
               defaultStyle: { font: 'Amiri' }
            };

            if (caseData.diagnosis) {
               docDefinition.content.push({ text: 'Medical Diagnosis', fontSize: 16, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] });
               docDefinition.content.push({ text: `Doctor: ${caseData.diagnosis.doctorName}`, fontSize: 11 });
               docDefinition.content.push({ text: `Date: ${new Date(caseData.diagnosis.completedAt).toLocaleDateString()}`, fontSize: 11, margin: [0, 0, 0, 2] });
               docDefinition.content.push({ text: 'Summary:', fontSize: 12, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] });
               docDefinition.content.push({ text: caseData.diagnosis.summary, fontSize: 10, margin: [0, 0, 0, 5] });
               docDefinition.content.push({ text: 'Advice:', fontSize: 12, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] });
               docDefinition.content.push({ text: caseData.diagnosis.advice, fontSize: 10, margin: [0, 0, 0, 5] });
               docDefinition.content.push({ text: 'Recommendations:', fontSize: 12, bold: true, color: '#7B2CBF', margin: [0, 5, 0, 2] });
               docDefinition.content.push({ text: caseData.diagnosis.recommendation, fontSize: 10, margin: [0, 0, 0, 2] });
            }
            docDefinition.footer = function (currentPage, pageCount) {
               return {
                  text: 'This report is confidential and intended only for the named recipient.',
                  alignment: 'center',
                  fontSize: 8,
                  margin: [0, 0, 0, 5]
               };
            };
            const pdfDoc = printer.createPdfKitDocument(docDefinition);
            pdfDoc.pipe(fs.createWriteStream(filepath));
            pdfDoc.end();

            pdfDoc.on('end', () => resolve(`/reports/${filename}`));
            pdfDoc.on('error', reject);
            pdfDoc.on('finish', () => resolve(`/reports/${filename}`));

         } catch (error) {
            reject(error);
         }
      });
   }
}

module.exports = PDFService;
