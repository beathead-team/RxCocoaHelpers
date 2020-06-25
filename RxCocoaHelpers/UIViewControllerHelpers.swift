//
//  UIViewControllerHelpers.swift
//  RxCocoaHelpers
//
//  Created by Victor Kurinny on 25.06.2020.
//  Copyright © 2020 BeatHead. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    public var loadView: ControlEvent<()> {
        return controlEventForVoidReturningSelector(#selector(Base.loadView))
    }

    @available(iOS 9.0, *)
    public var loadViewIfNeeded: ControlEvent<()> {
        return controlEventForVoidReturningSelector(#selector(Base.loadViewIfNeeded))
    }

    public var viewDidLoad: ControlEvent<()> {
        return controlEventForVoidReturningSelector(#selector(Base.viewDidLoad))
    }

    public var viewWillAppear: ControlEvent<Bool> {
        return controlEventForBoolReturningSelector(#selector(Base.viewWillAppear))
    }

    public var viewWillLayoutSubviews: ControlEvent<()> {
        return controlEventForVoidReturningSelector(#selector(Base.viewWillLayoutSubviews))
    }

    public var viewDidLayoutSubviews: ControlEvent<()> {
        return controlEventForVoidReturningSelector(#selector(Base.viewDidLayoutSubviews))
    }

    public var viewDidAppear: ControlEvent<Bool> {
        return controlEventForBoolReturningSelector(#selector(Base.viewDidAppear))
    }

    public var viewWillDisappear: ControlEvent<Bool> {
        return controlEventForBoolReturningSelector(#selector(Base.viewWillDisappear))
    }

    public var viewDidDisappear: ControlEvent<Bool> {
        return controlEventForBoolReturningSelector(#selector(Base.viewDidDisappear))
    }

    private func controlEventForVoidReturningSelector(_ sel: Selector) -> ControlEvent<()> {
        let source = self.methodInvoked(sel).map { _ in return () }
        return ControlEvent(events: source)
    }

    private func controlEventForBoolReturningSelector(_ sel: Selector) -> ControlEvent<Bool> {
        let source = self.methodInvoked(sel).map { args in return (args.first as? Bool) == true }
        return ControlEvent(events: source)
    }
}

extension Reactive where Base: UIViewController {
    public typealias MotionEvent = (motion: UIEvent.EventSubtype, event: UIEvent?)
    public var onMotionEnded: ControlEvent<(MotionEvent)> {
        let motionEvent: Observable<MotionEvent> = self
            .methodInvoked(#selector(Base.motionEnded(_:with:)))
            .map { arg in
                let motion = UIEvent.EventSubtype(rawValue: arg[0] as? Int ?? 0) ?? .none
                let event: UIEvent? = arg[1] as? UIEvent
                return (motion, event)
        }
        return ControlEvent(events: motionEvent)
    }
}

extension UIViewController {
    override open func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    }
}

#endif
