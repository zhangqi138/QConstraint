//
//  UIview+Extension.swift
//  Palette
//
//  Created by qishouhui on 2019/5/29.
//  Copyright © 2019 qishouhui. All rights reserved.
//

import UIKit


extension UIView{
     //此方法默认所有调用这些方法的view给自己添加约束
     //稍微智能一点，按layout的基本关系，把必须添加在父视图上这个比较容易犯的错误，写的智能一点，自动检查父视图
    func getQContraintView(view:UIView?) ->  (contSView:UIView?, relView:UIView?) { //contSView指的是要添加约束的view，relView是关系视图，self是被添加的视图
     
        
        guard (view != nil) else { //如果关系view为空,表示关系应该添加到自身身上。
           return (self,nil)
        }
        
        guard view! != self else { //如果view和self相同
            
            return (self , self)
           
        }
       
        if self.superview != nil {//父视图不为空
            if view! == superview{ //如果view本身就是self的父视图直接返回
                return (view,view)
                
            }else{
                if view!.superview != superview{ //如果关系view忘了添加到父视图上，添加以后再返回,应该不常用
                    superview!.addSubview(view!)
                    
                }
                return (superview,view)
            }
            
        }else{//如果父视图为空
            if (view!.superview != nil){ //如果view的superview不为空，默认将self添加到view的superview上,
                view!.superview!.addSubview(self)
                return (view!.superview , view)
            }else{//否则添加到本视图上
                view! .addSubview(self)
                return (view , view)
            }
            
        }
            
            
       
        
    }
    

    func setQConstraint(selfC:NSLayoutConstraint.Attribute,
                       view:UIView,
                       relation:NSLayoutConstraint.Relation,
                       viewC:NSLayoutConstraint.Attribute,
                       multiplier:CGFloat,
                       add : CGFloat
        ) -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        let (conSViewI,relViewI) = getQContraintView(view: view)
        if relViewI == nil { //如果关系view为空,表示是要设为固定值得约束
            addConstraint(NSLayoutConstraint.init(item: self, attribute: selfC, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: multiplier, constant: add))
            return
        }
        if conSViewI == nil {
            print("An unknown error occurred")
            return
        }
        conSViewI!.addConstraint(NSLayoutConstraint.init(item: self, attribute: selfC, relatedBy: relation, toItem:relViewI!, attribute: viewC, multiplier: multiplier, constant: add))
    }
    
    
    
    //提供几个快捷的关系
    func leftCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .left, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func rightCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .right, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func topCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .top, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func bottomCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .bottom, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func centerXCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .centerX, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func centerYCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .centerY, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func widthCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .width, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func heightCEqual(view:UIView , type:NSLayoutConstraint.Attribute,m:CGFloat,a : CGFloat ) -> Void {
        setQConstraint(selfC: .height, view: view, relation: .equal, viewC: type, multiplier: m, add: a)
    }
    func widthCEqual(W : CGFloat ) -> Void {
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: W))
    }
    func heightCEqual(H : CGFloat ) -> Void {
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: H))
    }
    func centerXCEqual(X : CGFloat ) -> Void {
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .centerX, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: X))
    }
    func centerYCEqual(Y: CGFloat ) -> Void {
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .centerY, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Y))
    }
}

