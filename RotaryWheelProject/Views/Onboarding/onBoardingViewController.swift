//
//  onBoardingViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 20/04/2023.
//

import UIKit

class onBoardingViewController: UIViewController {

    @IBAction func backButtonPressed(_ sender: Any) {
        if(currentPage>0){
            currentPage -= 2
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically , animated: true)
            
        }
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        if(currentPage==slides.count - 1){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PagingViewController") as! PagingViewController
            nextViewController.modalPresentationStyle = .currentContext
            self.present(nextViewController, animated:true, completion:nil)
        }else{

            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false

            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally , animated: true)
            collectionView.isPagingEnabled = true

        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if(currentPage == slides.count - 1){
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)

            }
        }
    }
    var slides: [onBoardingSlide] = []
    override func viewDidLoad() {
   
        super.viewDidLoad()
        slides = [onBoardingSlide(image: UIImage(named: "page_1.png")!), onBoardingSlide(image: UIImage(named: "page_2.jpg")!),onBoardingSlide(image: UIImage(named: "page_3.jpg")!), onBoardingSlide(image: UIImage(named: "page_4.jpg")!)]
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension onBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onBoardingCollectionViewCell.identifier, for: indexPath) as! onBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}




