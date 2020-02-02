#import "Tweak.h"
BOOL enabled;
HBPreferences *preferences;
NSInteger feedbackStyle;
NSInteger ringerStyle;


//12
%hook SpringBoard

-(void)_updateRingerState:(int)arg1 withVisuals:(BOOL)arg2 updatePreferenceRegister:(BOOL)arg3 {

    if(arg1 == 0) {
    
        if (enabled) {
    
        switch (feedbackStyle) {

            case 0:
            AudioServicesPlaySystemSoundWithCompletion(1519, ^{
                AudioServicesDisposeSystemSoundID(1519);
            });
            break;

            case 1:
            AudioServicesPlaySystemSoundWithCompletion(1520, ^{
                AudioServicesDisposeSystemSoundID(1520);
            });
            break;

            case 2:
            AudioServicesPlaySystemSoundWithCompletion(1521, ^{
                AudioServicesDisposeSystemSoundID(1521);
            });
            break;
            
            case 3:
            AudioServicesPlaySystemSoundWithCompletion(4095, ^{
                AudioServicesDisposeSystemSoundID(4095);
            });
            break;

            case 4:
            AudioServicesPlaySystemSoundWithCompletion(1011, ^{
                AudioServicesDisposeSystemSoundID(1011);
                });
            break;

            default:
            AudioServicesPlaySystemSoundWithCompletion(1011, ^{
                AudioServicesDisposeSystemSoundID(1011);
                });
            break;

            }
            }
            
            %orig;
        
}
        
    if (arg1 == 1) {
    
            NSURL *focusIconURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_app_icon.caf"];
            NSURL *focusKeyboardURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_keyboard.caf"];
            NSURL *focusLargeURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_large.caf"];
            NSURL *focusSmallURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_small.caf"];
        
            if (enabled) {
            
            switch (ringerStyle) {

                case 0:
                SystemSoundID focusIcon;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusIconURL,&focusIcon);
                AudioServicesPlaySystemSoundWithCompletion(focusIcon, ^{
                    AudioServicesDisposeSystemSoundID(focusIcon);
                    });
                break;

                case 1:
                SystemSoundID focusKeyboard;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusKeyboardURL,&focusKeyboard);
                AudioServicesPlaySystemSoundWithCompletion(focusKeyboard, ^{
                    AudioServicesDisposeSystemSoundID(focusKeyboard);
                    });
                break;

                case 2:
                SystemSoundID focusLarge;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusLargeURL,&focusLarge);
                AudioServicesPlaySystemSoundWithCompletion(focusLarge, ^{
                    AudioServicesDisposeSystemSoundID(focusLarge);
                    });
                break;
                
                case 3:
                SystemSoundID focusSmall;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusSmallURL,&focusSmall);
                AudioServicesPlaySystemSoundWithCompletion(focusSmall, ^{
                    AudioServicesDisposeSystemSoundID(focusSmall);
                    });
                break;

                case 4:
                break;

                default:
                break;

                }
            
            %orig;
            
            }
}
%orig;
}
%end


//13
%hook SBRingerControl

-(void)setRingerMuted:(BOOL)arg1 {

    if(arg1 == YES) {
    
        if (enabled) {
    
        switch (feedbackStyle) {

            case 0:
            AudioServicesPlaySystemSoundWithCompletion(1519, ^{
                AudioServicesDisposeSystemSoundID(1519);
            });
            break;

            case 1:
            AudioServicesPlaySystemSoundWithCompletion(1520, ^{
                AudioServicesDisposeSystemSoundID(1520);
            });
            break;

            case 2:
            AudioServicesPlaySystemSoundWithCompletion(1521, ^{
                AudioServicesDisposeSystemSoundID(1521);
            });
            break;
            
            case 3:
            AudioServicesPlaySystemSoundWithCompletion(4095, ^{
                AudioServicesDisposeSystemSoundID(4095);
            });
            break;

            case 4:
            AudioServicesPlaySystemSoundWithCompletion(1011, ^{
                AudioServicesDisposeSystemSoundID(1011);
                });
            break;

            default:
            AudioServicesPlaySystemSoundWithCompletion(1011, ^{
                AudioServicesDisposeSystemSoundID(1011);
                });
            break;

            }
            }
            
            %orig;
        
}
        
    if (arg1 == NO) {
    
            NSURL *focusIconURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_app_icon.caf"];
            NSURL *focusKeyboardURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_keyboard.caf"];
            NSURL *focusLargeURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_large.caf"];
            NSURL *focusSmallURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/focus_change_small.caf"];
        
            if (enabled) {
            
            switch (ringerStyle) {

                case 0:
                SystemSoundID focusIcon;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusIconURL,&focusIcon);
                AudioServicesPlaySystemSoundWithCompletion(focusIcon, ^{
                    AudioServicesDisposeSystemSoundID(focusIcon);
                    });
                break;

                case 1:
                SystemSoundID focusKeyboard;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusKeyboardURL,&focusKeyboard);
                AudioServicesPlaySystemSoundWithCompletion(focusKeyboard, ^{
                    AudioServicesDisposeSystemSoundID(focusKeyboard);
                    });
                break;

                case 2:
                SystemSoundID focusLarge;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusLargeURL,&focusLarge);
                AudioServicesPlaySystemSoundWithCompletion(focusLarge, ^{
                    AudioServicesDisposeSystemSoundID(focusLarge);
                    });
                break;
                
                case 3:
                SystemSoundID focusSmall;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)focusSmallURL,&focusSmall);
                AudioServicesPlaySystemSoundWithCompletion(focusSmall, ^{
                    AudioServicesDisposeSystemSoundID(focusSmall);
                    });
                break;

                case 4:
                break;

                default:
                break;

                }
            
            %orig;
            
            }
}
%orig;
}

%end





%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.mutevibes"];
    [preferences registerBool:&enabled default:YES forKey:@"enabled"];
    [preferences registerInteger:&feedbackStyle default:0 forKey:@"feedbackStyle"];
    [preferences registerInteger:&ringerStyle default:0 forKey:@"ringerStyle"];
        
};

