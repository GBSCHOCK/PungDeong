//
//  SwiftUIView-imagescrollview.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var images = [#imageLiteral(resourceName: "테스트설명1"),#imageLiteral(imageLiteralResourceName: "테스트설명2"),#imageLiteral(resourceName: "Castle")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
        
    }
    
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }

}
