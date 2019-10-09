//  ExtensionUIViewAnchor.swift
//  Sezer Tunca
//
//  Autolayout helper class  
//  Usage example: view.anchor(top: nav.topAnchor, left: leftAnchor, bottom: nil, right: nil,
//                             padding: .init(top: 10, left: 10, bottom: 0, right: 0),
//                             size: .init(width: 100, height: 50)))
//
//  Created by Sezer Tunca on 12/07/2018.
//  Copyright © 2019 Sezer Tunca. All rights reserved.
//


import UIKit

extension UIView
{    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero)
    {   
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top
        {
            anchors.append(topAnchor.constraint(equalTo: top, constant: padding.top))
        }
        
        if let left = left
        {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: padding.left))
        }
        
        if let bottom = bottom
        {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
        }
        
        if let right = right
        {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -padding.right))
        }
        
        if size.width > 0
        {
            anchors.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.height > 0
        {
            anchors.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        
        anchors.forEach({$0.isActive = true})
    }

    
    public func fillSuperView(padding: UIEdgeInsets = .zero)
    {
        self.anchor(top: superview?.topAnchor,
                      left: superview?.leftAnchor,
                      bottom: superview?.bottomAnchor,
                      right: superview?.rightAnchor,
                      padding: .init(top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right),
                      size: .zero)
    }
    
    func centerInSuperView(size: CGSize = .zero)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewCenterXAnchor = superview?.centerXAnchor
        {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }

        if let superviewCenterYAnchor = superview?.centerYAnchor
        {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }

        if size.width != 0
        {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0
        {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    

    func constrainWidth(constant: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func constrainHeight(constant: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func anchorSize(width: CGFloat, height: CGFloat, centerToSuperView: Bool = false)
    {
        self.anchor(top: nil,
                    left: nil,
                    bottom: nil,
                    right: nil,
                    padding: .zero,
                    size: .init(width: width, height: height))
        
        if centerToSuperView
        {
            self.anchorCenterSuperview()
        }
    }
    
    public func addConstraintsWithFormat(_ format: String, views: UIView...)
    {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated()
        {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    

    public func anchorCenterXToSuperview(constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor
        {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterXToView(view: UIView, constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    public func anchorCenterYToSuperview(constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor
        {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterYTo(anchor: NSLayoutYAxisAnchor)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    public func anchorCenterSuperview()
    {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
}

struct AnchoredConstraints
{
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
