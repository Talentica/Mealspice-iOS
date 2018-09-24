//
//  ViewController.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import UIKit
import SDWebImage
//MARK: ADMob
import GoogleMobileAds

class DetailsViewController: UIViewController,GADBannerViewDelegate,GADUnifiedNativeAdLoaderDelegate {
    
    //  MARK: Banner
    var bannerView: GADBannerView!
    
    //  MARK: interstitial
    var interstitial: GADInterstitial!
    
    
    //  MARK:- Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var address: UILabel!
    
    // MARK: native-ad
    @IBOutlet weak var adView: GADUnifiedNativeAdView!
    
    //  MARK:- Other Variables
    var restaurantId: String = ""
    var restaurantViewModel: RestaurantViewModel!
    
    // MARK: native-ad
    let adUnitID = "ca-app-pub-3940256099942544/8407707713"
    let numAdsToLoad = 1
    var nativeAd:GADUnifiedNativeAd!
    var adLoader: GADAdLoader!
    
    //  MARK:- ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant Detail"
        self.restaurantViewModel = RestaurantViewModel(restaurantId: self.restaurantId) { status in
            if status == "success" {
                self.bindOutlets()
            } else {
                // TODO: handle error here
            }
        }
        
        //  MARK: Banner
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.delegate = self
        addBannerViewToView(bannerView)
        bannerView.load(GADRequest())
        
        //  MARK: interstitial
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        
        // MARK: native-ad
        let options = GADMultipleAdsAdLoaderOptions()
        options.numberOfAds = self.numAdsToLoad
        
        self.adLoader = GADAdLoader(adUnitID: self.adUnitID,
                                    rootViewController: self,
                                    adTypes: [.unifiedNative],
                                    options: [options])
        self.adLoader.delegate = self
        self.adLoader.load(GADRequest())
        
    }
    
    
    // MARK: native-ad
    func adLoader(_ adLoader: GADAdLoader,
                  didFailToReceiveAdWithError error: GADRequestError) {
        print("\(adLoader) failed with error: \(error.localizedDescription)")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
        print("Received native ad: \(nativeAd)")
        self.nativeAd = nativeAd
    }
    
    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        showNativeAd()
    }
    
    // MARK: native-ad
    func showNativeAd(){
        self.nativeAd.rootViewController = self
        
        self.adView.nativeAd = self.nativeAd
        
        (self.adView.headlineView as! UILabel).text = self.nativeAd.headline
        
        (self.adView.callToActionView as! UIButton).isUserInteractionEnabled = false
        (self.adView.callToActionView as! UIButton).setTitle(
            self.nativeAd.callToAction, for: UIControlState.normal)
    }
    
    
    // MARK: Banner
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    
    @IBAction func onButtonClick(_ sender: Any) {
        //  MARK: interstitial
                if interstitial.isReady {
                    interstitial.present(fromRootViewController: self)
                } else {
                    print("Ad wasn't ready")
                }
        
//        //  MARK: rewardAd
//        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
//            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
//        }
    }
    
    
    //  MARK:- Other Methods
    func bindOutlets() {
        // bind properties in RestaurantViewModel to outlets
        restaurantViewModel.restaurantName.bind { [unowned self] in
            self.restaurantName.text = $0
        }
        restaurantViewModel.tagline.bind { [unowned self] in
            self.tagline.text = $0
        }
        restaurantViewModel.rating.bind { [unowned self] in
            self.rating.text = "\($0)"
        }
        restaurantViewModel.imageUrl.bind { [unowned self] in
            self.imageView.sd_setImage(with: URL(string: $0), completed: nil)
        }
        restaurantViewModel.address.bind { [unowned self] in
            self.address.text = $0
        }
    }
    
    //MARK: Banner - delegates
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adlog adViewDidReceiveAd")
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adlog adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adlog adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adlog adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adlog adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adlog adViewWillLeaveApplication")
    }
    
    
}

