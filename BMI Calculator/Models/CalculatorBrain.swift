import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiOneDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiOneDecimal
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        let color = (underweight: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), healthy: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), overweight: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), obese: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), superObese: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        
        switch bmiValue{
        case 0...18.5:
            bmi = BMI(value: bmiValue, advice: "Underweight", color: color.underweight)
        case 18.6...24.9:
            bmi = BMI(value: bmiValue, advice: "Healthy", color: color.healthy )
        case 25...29.9:
            bmi = BMI(value: bmiValue, advice: "Overweight", color: color.overweight)
        case 30...34.9:
            bmi = BMI(value: bmiValue, advice: "Obese", color: color.obese)
        default:
            bmi = BMI(value: bmiValue, advice: "Super obese", color: color.superObese)
        }
        
    }
    
}
