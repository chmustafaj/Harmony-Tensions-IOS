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
        slides = [onBoardingSlide(image: UIImage(named: "screen_1.jpg")!, title: "Harmony Tensions", description: "Explore the art of musical improvisation with Harmony Tensions, an engaging platform designed for solo or group play."), onBoardingSlide(image: UIImage(named: "screen_2.jpg")!, title: "Select a Key", description: "Use the harmony wheel to select a key for the chord progression"),onBoardingSlide(image: UIImage(named: "screen_3.jpg")!, title: "Start game",description: "Pick a level of difficulty for the chord progression, a tempo, and press start" ), onBoardingSlide(image: UIImage(named: "screen_4.jpg")!, title: "Play along", description: "Get your instrument and start jamming with the chords displayed. Green notes are current;yellow are next"), onBoardingSlide(image: UIImage(named: "screen_5.jpg")!, title: "Increase level", description: "Level up difficulty with added chords like secondary dominants in level two and include diminished notes in level three.")]
      
    }
    

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




