const PDFDocument = require('pdfkit');
const fs = require('fs');
const path = require('path');

class PDFService {
  
  static async generateDiagnosisReport(caseData) {
    return new Promise((resolve, reject) => {
      try {
        const reportsDir = path.join(__dirname, '../../reports');
        if (!fs.existsSync(reportsDir)) {
          fs.mkdirSync(reportsDir, { recursive: true });
        }
        const filename = `diagnosis_${caseData._id}_${Date.now()}.pdf`;
        const filepath = path.join(reportsDir, filename);
        const doc = new PDFDocument({ margin: 50 });
        const stream = fs.createWriteStream(filepath);

        doc.pipe(stream);
        doc.fontSize(24)
           .fillColor('#7B2CBF')
           .text('Mind Bloom', { align: 'center' });
        
        doc.fontSize(18)
           .fillColor('#000000')
           .text('ADHD Screening Report', { align: 'center' });
        
        doc.moveDown();
        doc.fontSize(10)
           .text(`Report Date: ${new Date().toLocaleDateString()}`, { align: 'right' });
        
        doc.moveDown(2);
        doc.moveTo(50, doc.y)
           .lineTo(550, doc.y)
           .stroke();
        
        doc.moveDown();
        doc.fontSize(14)
           .fillColor('#7B2CBF')
           .text('Child Information');
        
        doc.fontSize(11)
           .fillColor('#000000')
           .text(`Name: ${caseData.childFirstName} ${caseData.childLastName}`)
           .text(`Age: ${caseData.childAge}`)
           .text(`Sex: ${caseData.childSex}`)
           .text(`Grade: ${caseData.scholarYear}`)
           .moveDown();
        doc.fontSize(14)
           .fillColor('#7B2CBF')
           .text('Parent Information');
        
        doc.fontSize(11)
           .fillColor('#000000')
           .text(`Name: ${caseData.parentId.firstName} ${caseData.parentId.lastName}`)
           .text(`Relationship: ${caseData.parentId.relationToChild}`)
           .text(`Email: ${caseData.parentId.email}`)
           .moveDown();
        doc.fontSize(14)
           .fillColor('#7B2CBF')
           .text('Screening Results');
        
        doc.fontSize(11)
           .fillColor('#000000')
           .text(`Severity Score: ${caseData.gravityScore.toUpperCase()}`)
           .moveDown();
        doc.fontSize(12)
           .fillColor('#7B2CBF')
           .text('Questionnaire Responses:');
        
        doc.fontSize(10)
           .fillColor('#000000');
        
        caseData.screeningAnswers.forEach((qa, index) => {
          doc.text(`${index + 1}. ${qa.question}`, { continued: false });
          doc.text(`   Answer: ${qa.answer}`, { indent: 20 });
          doc.moveDown(0.5);
        });

        doc.moveDown();
        if (caseData.diagnosis) {
          doc.addPage();
          
          doc.fontSize(16)
             .fillColor('#7B2CBF')
             .text('Medical Diagnosis');
          
          doc.moveDown();

          doc.fontSize(11)
             .fillColor('#000000')
             .text(`Doctor: ${caseData.diagnosis.doctorName}`)
             .text(`Date: ${new Date(caseData.diagnosis.completedAt).toLocaleDateString()}`)
             .moveDown();

          doc.fontSize(12)
             .fillColor('#7B2CBF')
             .text('Summary:');
          
          doc.fontSize(10)
             .fillColor('#000000')
             .text(caseData.diagnosis.summary, { align: 'justify' })
             .moveDown();

          doc.fontSize(12)
             .fillColor('#7B2CBF')
             .text('Advice:');
          
          doc.fontSize(10)
             .fillColor('#000000')
             .text(caseData.diagnosis.advice, { align: 'justify' })
             .moveDown();

          doc.fontSize(12)
             .fillColor('#7B2CBF')
             .text('Recommendation:');
          
          doc.fontSize(10)
             .fillColor('#000000')
             .text(caseData.diagnosis.recommendation, { align: 'justify' });
        }
        doc.fontSize(8)
           .fillColor('#666666')
           .text(
             'This report is confidential and intended only for the named recipient.',
             50,
             doc.page.height - 50,
             { align: 'center' }
           );
        doc.end();

        stream.on('finish', () => {
          resolve(`/reports/${filename}`);
        });

        stream.on('error', reject);

      } catch (error) {
        reject(error);
      }
    });
  }
}

module.exports = PDFService;