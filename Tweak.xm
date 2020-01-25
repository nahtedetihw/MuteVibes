#import "Tweak.h"

BOOL enabled;
HBPreferences *preferences;
NSInteger feedbackStyle;
NSInteger ringerStyle;

%hook SpringBoard


- (void)_updateRingerState:(int)arg1 withVisuals:(BOOL)arg2 updatePreferenceRegister:(BOOL)arg3 {

    if(arg1 == 0) {
    
        if (enabled) {
    
        switch (feedbackStyle) {

            case 0:
            AudioServicesPlaySystemSound(1519);
            break;

            case 1:
            AudioServicesPlaySystemSound(1520);
            break;

            case 2:
            AudioServicesPlaySystemSound(1521);
            break;
            
            case 3:
            AudioServicesPlaySystemSound(4095);
            break;

            case 4:
            break;

            default:
            break;

            }
            
            }
            
            %orig;
        
}
        
    if (arg1 == 1) {
    
            if (enabled) {
        
            switch (ringerStyle) {

                case 0:
                AudioServicesPlaySystemSound(1110);
                break;

                case 1:
                AudioServicesPlaySystemSound(1006);
                break;

                case 2:
                AudioServicesPlaySystemSound(1109);
                break;
                
                case 3:
                AudioServicesPlaySystemSound(1071);
                break;

                case 4:
                break;

                default:
                break;

                }
        
            }
            
            %orig;
}
}
    
%end

%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.mutevibes"];
    [preferences registerBool:&enabled default:YES forKey:@"enabled"];
    [preferences registerInteger:&feedbackStyle default:0 forKey:@"feedbackStyle"];
    [preferences registerInteger:&ringerStyle default:0 forKey:@"ringerStyle"];
        
};
