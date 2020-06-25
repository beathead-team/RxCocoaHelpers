//
//  UIApplicationHelpers.swift
//  RxCocoaHelpers
//
//  Created by Victor Kurinny on 25.06.2020.
//  Copyright © 2020 BeatHead. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIApplication {
    public static var willResignActive: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.willResignActiveNotification).map { _ in return () }

        return ControlEvent(events: source)
    }

    public static var didEnterBackground: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification).map { _ in return () }

        return ControlEvent(events: source)
    }

    public static var willEnterForeground: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification).map { _ in return () }

        return ControlEvent(events: source)
    }

    public static var didBecomeActive: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.didBecomeActiveNotification).map { _ in return () }

        return ControlEvent(events: source)
    }

    public static var willTerminate: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.willTerminateNotification).map { _ in return () }

        return ControlEvent(events: source)
    }

    public static var didReceiveMemoryWarning: ControlEvent<()> {
        let source = NotificationCenter.default.rx.notification(UIApplication.didReceiveMemoryWarningNotification).map { _ in return () }

        return ControlEvent(events: source)
    }
}

#endif
