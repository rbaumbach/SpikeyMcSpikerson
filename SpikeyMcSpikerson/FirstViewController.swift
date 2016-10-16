import UIKit
import Alamofire

class FirstViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: Init Methods
    
    // if you implement the init() method for the view controller, you must implement the required init method
    // for coder junk
    // I know that I'm not going to be loading this from a storyboard, so lets do nothing
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "1st"
    }
    
    // MARK: View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getSomeHeaders()
    }
    
    // MARK: Private Methods
    
    private func getSomeHeaders() {
        let headers = buildHeaderParams()
        
        _ = Alamofire.request("https://httpbin.org/headers", headers: headers).responseJSON { [weak self] response in
            // self?.printReponse(response: response)
            
            if let json = response.result.value as? [String: [String: String]]  {
                print("JSON: \(json)")
                
                if let headers = json["headers"] {
                    self?.textView.text = self?.buildHeaderText(dictOfHeaders: headers)
                }
            }
        }
    }
    
    private func buildHeaderParams() -> HTTPHeaders {
        return [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]
    }
    
    private func printReponse(response: DataResponse<Any>) {
            debugPrint(response)     // print everything

            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
    }
    
    private func buildHeaderText(dictOfHeaders: [String: String]) -> String {
        var headerText: String = "Some headers from httpbin.org...\n\n"
        
        for (key, value) in dictOfHeaders {
            headerText += key
            headerText += ": "
            headerText += value
            headerText += "\n"
        }
        
        return headerText
    }
}
