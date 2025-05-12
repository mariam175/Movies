//
//  PageViewController.swift
//  movies
//
//  Created by Macos on 05/05/2025.
//

import UIKit

class PageViewController: UIPageViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource{
    
    
    var pages:[UIViewController] = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        let v1 = self.storyboard?.instantiateViewController(identifier: "v1")
        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "FavsTableViewController")
        pages.append(v1!)
        pages.append(v2!)
        
        if let firstVC = pages.first{
            setViewControllers([firstVC], direction: .forward, animated: true , completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let firstIndex = pages.firstIndex(of: viewController)else{
            return nil
        }
        
        let prev = firstIndex - 1
        guard prev < 0 else{
            return pages[prev]
        }
        return pages.last
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let firstIndex = pages.firstIndex(of: viewController)else{
            return nil
        }
        
        let next = firstIndex + 1
        guard next >= pages.count else{
            return pages[next]
        }
        return pages.first
        
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed, let currentVC = viewControllers?.first {
           // let color = currentVC.view.backgroundColor
            let color = currentVC.view.backgroundColor ?? .blue
                    self.view.backgroundColor = color
            
        }
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
